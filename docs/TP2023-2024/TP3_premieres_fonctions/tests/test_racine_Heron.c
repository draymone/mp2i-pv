#include <math.h>
#include <assert.h>

int main(void){
  double epsilon = 0.001;

  assert(fabs(racine_Heron(0.1, precisiontest) - sqrt(.1)) < epsilon);
  assert(fabs(racine_Heron(.5, precisiontest) - sqrt(.5)) < epsilon);
  assert(fabs(racine_Heron(xtest, precisiontest) - sqrt(xtest)) < epsilon);

  return 0;
}
