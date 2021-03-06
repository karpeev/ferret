[Mesh]
  file=slab.e
[]
[Variables]
  [./polar_x]
    order = FIRST
    family = LAGRANGE
    block='interior exterior'
  [../]
  [./polar_y]
    order = FIRST
    family = LAGRANGE
    block='interior exterior'
  [../]
  [./polar_z]
    order = FIRST
    family = LAGRANGE
    block='interior exterior'
  [../]
[]

[AuxVariables]
  [./auxv_wall_energy_density]
     order=CONSTANT
     family=MONOMIAL
  [../]
[]

[GlobalParams]
   len_scale=1e-7
   energy_scale=1e12
   G110=1.73e4
   G11/G110=0.6
   G12/G110=0.0
   G44/G110=0.3
   G44P/G110=0.3
   polar_x=polar_x
   polar_y=polar_y
   polar_z=polar_z
[]

[AuxKernels]
  [./auxk_wall_energy_density]
    type =WallEnergyDensity
    variable =auxv_wall_energy_density
  [../]
[]

[Kernels]
  [./walled_x]
     type=WallEnergyDerivative
     variable=polar_x
     component=0
     implicit=false
  [../]
  [./walled_y]
     type=WallEnergyDerivative
     variable=polar_y
     component=1
     implicit=false
  [../]
  [./walled_z]
     type=WallEnergyDerivative
     variable=polar_z
     component=2
     implicit=false
  [../]
  [./polar_x_time]
     type=TimeDerivative
     variable=polar_x
  [../]
  [./polar_y_time]
     type=TimeDerivative
     variable=polar_y
  [../]
  [./polar_z_time]
     type=TimeDerivative
     variable=polar_z
  [../]
[]

[Functions]
  [./fx]
    type=ParsedFunction
    value=x
  [../]
  [./fy]
    type=ParsedFunction
    value=y
  [../]
  [./fz]
    type=ParsedFunction
    value=z
  [../]
[]

[ICs]
  [./polar_x_fic]
     type=FunctionIC
     variable=polar_x
     function=fx
  [../]
  [./polar_y_fic]
     type=FunctionIC
     variable=polar_y
     function=fy
  [../]
  [./polar_z_fic]
     type=FunctionIC
     variable=polar_z
     function=fz
  [../]
[]

[Preconditioning]
   [./smp]
     type=SMP   #or SMP
     full=true
     pc_side=left
   [../]
[]

[Executioner]
  #type = Steady
  type=Transient
  solve_type=newton
  scheme=explicit-euler     #"implicit-euler, explicit-euler, crank-nicolson, bdf2, rk-2"
  dt=1e-12
  nl_max_its=100
  num_steps=2400
  petsc_options='-ksp_monitor_true_residual -snes_monitor -snes_view -snes_converged_reason -snes_linesearch_monitor -options_left'
  petsc_options_iname='-gmres_restart -snes_rtol -ksp_type  -ksp_rtol -pc_type -snes_linesearch_type -pc_factor_zeropivot'
  petsc_options_value='1000            1e-5        gmres       1e-8      jacobi       basic                1e-50'
[]

[Postprocessors]
   [./wall_energy]
    type=WallEnergy
    [../]
[]

[Outputs]
  output_initial = true
  exodus = true
  [./console]
    type = Console
    perf_log = true
  [../]
[]