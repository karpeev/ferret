#ifndef TENSORPRESSUREAUX_H
#define TENSORPRESSUREAUX_H

#include "AuxKernel.h"
#include "TensorMechanicsMaterial.h" //may not need this
#include "RankTwoTensor.h"

//Forward declarations
class TensorPressureAux;

template<>
InputParameters validParams<TensorPressureAux>();


class TensorPressureAux : public AuxKernel
{
public:
  TensorPressureAux( const std::string & name, InputParameters parameters );

  virtual ~TensorPressureAux() {}

protected:
  virtual Real computeValue();

private:
  MaterialProperty<RankTwoTensor> & _stress;

};

#endif // TENSORPRESSUREAUX_H
