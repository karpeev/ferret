[Mesh]
  file = poissonstripe_coarse.e
  uniform_refine=1
[]
[Variables]
#active='polar_x polar_y polar_z'
  # [./polar_x]
  #   #scaling=1e-3
  #   order = FIRST
  #   family = LAGRANGE
  #   block='interior'
  # [../]
  # [./polar_y]
  #   #scaling=1e-3
  #   order = FIRST
  #   family = LAGRANGE
  #   block='interior'
  # [../]
  # [./polar_z]
  #   #scaling=1e-3
  #   order = FIRST
  #   family = LAGRANGE
  #   block='interior'
  # [../]
  [./potential]
    order=FIRST
    family = LAGRANGE
  [../]
  [./polar_x]
    order = CONSTANT
    family = MONOMIAL
    #block='interior'
  [../]
  [./polar_y]
    order = CONSTANT
    family = MONOMIAL
    #block='interior'
  [../]
  [./polar_z]
    order = CONSTANT
    family = MONOMIAL
    #block='interior'
  [../]
[]

[Kernels]
 active='bed_x bed_y bed_z diffusion_E'
  [./bed_x]
    type = BulkEnergyDerivative
    variable = polar_x
    component=0
    polar_x = polar_x
    polar_y = polar_y
    polar_z = polar_z
    alpha1=-1.7252e8 # 3.8(T-479)*10^5 C^{-2}m^2
    alpha11=-7.3e7
    alpha111=2.6e8
    alpha12=7.5e8
    alpha112=6.1e8
    alpha123=-3.7e9
    #alpha12=0.0
    #alpha112=0.0
    #alpha123=0.0
    #block='interior'
   # alpha112=0.0
   # alpha123=0.0
  [../]
  [./bed_y]
    type = BulkEnergyDerivative
    variable = polar_y
    component=1
    polar_x = polar_x
    polar_y = polar_y
    polar_z = polar_z
    alpha1=-1.7252e8 # 3.8(T-479)*10^5 C^{-2}m^2
    alpha11=-7.3e7
    alpha111=2.6e8
    alpha12=7.5e8
    alpha112=6.1e8
    alpha123=-3.7e9
    #alpha12=0.0
    #alpha112=0.0
    #alpha123=0.0
    #block='interior'
   # alpha112=0.0
   # alpha123=0.0

  [../]
  [./bed_z]
    type = BulkEnergyDerivative
    variable = polar_z
    component=2
    polar_x = polar_x
    polar_y = polar_y
    polar_z = polar_z
    alpha1=-1.7252e8 # 3.8(T-479)*10^5 C^{-2}m^2
    alpha11=-7.3e7
    alpha111=2.6e8
    alpha12=7.5e8
    alpha112=6.1e8
    alpha123=-3.7e9
    #alpha12=0.0
    #alpha112=0.0
    #alpha123=0.0
    #block='interior'
   # alpha112=0.0
   # alpha123=0.0
  [../]
  [./walled_x]
     type=WallEnergyDerivative
     variable=polar_x
     component=0
     polar_x=polar_x
     polar_y=polar_y
     polar_z=polar_z
     G110=1.73e-10
     G11/G110=0.6
     G12/G110=0.0
     G44/G110=0.3
     G44P/G110=0.3
  [../]
  [./walled_y]
     type=WallEnergyDerivative
     variable=polar_y
     component=1
     polar_x=polar_x
     polar_y=polar_y
     polar_z=polar_z
     G110=1.73e-10
     G11/G110=0.6
     G12/G110=0.0
     G44/G110=0.3
     G44P/G110=0.3
  [../]
  [./walled_z]
     type=WallEnergyDerivative
     variable=polar_z
     component=2
     polar_x=polar_x
     polar_y=polar_y
     polar_z=polar_z
     G110=1.73e-10
     G11/G110=0.6
     G12/G110=0.0
     G44/G110=0.3
     G44P/G110=0.3
  [../]
  [./polar_electric_E]
     type=PolarElectricE
     variable=potential
     polar_x = polar_x
     polar_y = polar_y
     polar_z = polar_z
     permittivity=8.85e-12
     block='interior'
  [../]
  [./diffusion_E]
     type=ElectricStatics
     variable=potential
     permittivity=8.85e-12
     block='exterior interior'
  [../]
  [./polar_electric_px]
     type=PolarElectricP
     variable=polar_x
     component=0
     potential=potential
  [../]
  [./polar_electric_py]
     type=PolarElectricP
     variable=polar_y
     component=1
     potential=potential
  [../]
  [./polar_electric_pz]
     type=PolarElectricP
     variable=polar_z
     component=2
     potential=potential
  [../]
[]

[ICs]
  active='polar_x_constic polar_y_constic polar_z_constic'
  [./polar_x]
     type=SphereIC
     variable=polar_x
     radial_function=radial
     polar_function=polar
     azimuthal_function=azimuthal
     index=0
  [../]
  [./polar_y]
     type=SphereIC
     variable=polar_y
     radial_function=radial
     polar_function=polar
     azimuthal_function=azimuthal
     index=1
  [../]
  [./polar_z]
     type=SphereIC
     variable=polar_z
     radial_function=radial
     polar_function=polar
     azimuthal_function=azimuthal
     index=2
  [../]
  [./polar_x_constic]
     type=ConstantIC
     variable=polar_x
     value=1.0
  [../]
  [./polar_y_constic]
     type=ConstantIC
     variable=polar_y
     value=0.0
  [../]
  [./polar_z_constic]
     type=ConstantIC
     variable=polar_z
     value=0.0
  [../]
[]

[BCs]
 active ='potential_upz potential_downz'
  [./potential_upz]
    type = DirichletBC
    variable = potential
    boundary = 'upz'
    value = 1.0
  [../]
  [./potential_downz]
    type = DirichletBC
    variable = potential
    boundary = 'downz'
    value = -1.0
  [../]
  [./Periodic]
    #active='polar_x_x polar_y_x polar_z_x polar_x_y polar_y_y polar_z_y'
    [./potential_x]
       variable = potential
       primary = 'downx'
       secondary = 'upx'
       translation = '1 0 0'
    [../]
    [./polar_x_x]
       variable = polar_x
       primary = 'downx'
       secondary = 'upx'
       translation = '1 0 0'
    [../]
    [./polar_y_x]
       variable = polar_y
       primary = 'downx'
       secondary = 'upx'
       translation = '1 0 0'
    [../]
    [./polar_z_x]
       variable = polar_z
       primary = 'downx'
       secondary = 'upx'
       translation = '1 0 0'
    [../]
    [./potential_y]
       variable = potential
       primary = 'downy'
       secondary ='upy'
       translation = '0 1 0'
    [../]
    [./polar_x_y]
       variable = polar_x
       primary = 'downy'
       secondary ='upy'
       translation = '0 1 0'
    [../]
    [./polar_y_y]
       variable = polar_y
       primary = 'downy'
       secondary ='upy'
       translation = '0 1 0'
    [../]
    [./polar_z_y]
       variable = polar_z
       primary = 'downy'
       secondary ='upy'
       translation = '0 1 0'
    [../]
  [../]
[]
[Preconditioning]
   [./smp]
     type=SMP   #or SMP
     #off_diag_row='var_name'
     #off_diag_column='var_name'
     full=true   #to use every off diagonal block
     pc_side=left
     #petsc_options='snes_mf_operator'
     #petsc_options_iname = '-pc_type -mat_fd_coloring_err -mat_fd_type'
     #petsc_options_value = 'lu       1e-6                 ds'
   [../]
[]

[Executioner]
  type = Steady
  nl_max_its=1000
  #petsc_options="-snes_monitor -snes_converged_reason -ksp_monitor -ksp_converged_reason"
 # petsc_options='-snes_monitor -snes_converged_reason -ksp_monitor -ksp_converged_reason'
  petsc_options='-snes_monitor -snes_view -snes_converged_reason -ksp_monitor_singular_value -ksp_monitor_short'
  petsc_options_iname='-snes_max_it -snes_rtol -snes_max_funcs -ksp_type  -ksp_gmres_restart -pc_type'
  petsc_options_value='10000000         1e-10      100000000       preonly    1000            lu'
  #petsc_options_iname='-snes_rtol'
  #petsc_options_value='1e-16'
[]
[Functions]
  [./radial]
      type=SolutionFunction
      file_type=exodusII
      mesh=initvalues.e       #file name like: in.e
      variable=radial   #the variable in the file to be read in
      timestep=1   #the timestep to be read in.
  [../]
  [./azimuthal]
     type=SolutionFunction
     file_type=exodusII
     mesh=initvalues.e       #file name like: in.e
     variable=azimuthal_angle   #the variable in the file to be read in
     timestep=1   #the timestep to be read in.
  [../]
  [./polar]
     type=SolutionFunction
     file_type=exodusII
     mesh=initvalues.e       #file name like: in.e
     variable=polar_angle   #the variable in the file to be read in
     timestep=1   #the timestep to be read in.
  [../]
[]
[Output]
  #file_base = out
  output_initial=1
  #interval = 1
  exodus = true
  perf_log = true
[]
