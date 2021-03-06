/**
 * @file   BulkEnergy.C
 * @author S. Gu <sgu@anl.gov>
 * @date   Tue Jun  4 15:01:35 2013
 *
 * @brief
 *
 *
 */


#include "BulkEnergy.h"

template<>
InputParameters validParams<BulkEnergy>()
{

  InputParameters params = validParams<ElementIntegralPostprocessor>();
  params.addRequiredCoupledVar("polar_x", "The x component of the polarization");
  params.addRequiredCoupledVar("polar_y", "The y component of the polarization");
  params.addRequiredCoupledVar("polar_z", "The z component of the polarization");
  params.addRequiredParam<Real>("alpha1"," "); //FIXME: Give me an explanation
  params.addRequiredParam<Real>("alpha11"," ");
  params.addRequiredParam<Real>("alpha12"," ");
  params.addRequiredParam<Real>("alpha111"," ");
  params.addRequiredParam<Real>("alpha112"," ");
  params.addRequiredParam<Real>("alpha123"," ");
  params.addParam<Real>("len_scale",1.0,"the len_scale of the unit");
  params.addParam<Real>("energy_scale",1.0,"energy scale");
  return params;
}

BulkEnergy::BulkEnergy(const std::string & name, InputParameters parameters) :
  ElementIntegralPostprocessor(name, parameters),
  _polar_x(coupledValue("polar_x")),
  _polar_y(coupledValue("polar_y")),
  _polar_z(coupledValue("polar_z")),
  _alpha1(getParam<Real>("alpha1")),
  _alpha11(getParam<Real>("alpha11")),
  _alpha12(getParam<Real>("alpha12")),
  _alpha111(getParam<Real>("alpha111")),
  _alpha112(getParam<Real>("alpha112")),
  _alpha123(getParam<Real>("alpha123")),
  _len_scale(getParam<Real>("len_scale")),
  _energy_scale(getParam<Real>("energy_scale"))
{
}

Real
BulkEnergy::computeQpIntegral()
{
  return (_alpha1*(pow(_polar_x[_qp],2)+pow(_polar_y[_qp],2)+pow(_polar_z[_qp],2))+
    _alpha12*(pow(_polar_x[_qp],2)*pow(_polar_y[_qp],2)+
	      pow(_polar_y[_qp],2)*pow(_polar_z[_qp],2)+
	      pow(_polar_x[_qp],2)*pow(_polar_z[_qp],2))+
    _alpha111*(pow(_polar_x[_qp],6)+pow(_polar_y[_qp],6)+pow(_polar_z[_qp],6))+
    _alpha112*(pow(_polar_x[_qp],4)*(pow(_polar_y[_qp],2)+pow(_polar_z[_qp],2))
	      +pow(_polar_y[_qp],4)*(pow(_polar_z[_qp],2)+pow(_polar_x[_qp],2))
	      +pow(_polar_z[_qp],4)*(pow(_polar_x[_qp],2)+pow(_polar_y[_qp],2)))+
	  _alpha123*(pow(_polar_x[_qp],2)*pow(_polar_y[_qp],2)*pow(_polar_z[_qp],2)))*pow(_len_scale,3)*_energy_scale;
}
