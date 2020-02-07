//Hunter Vaccaro
//hpv8hf
//threexinput.cpp
//11/19/2019
#include <iostream>
#include <time.h>
#include <cstdlib>
#include "timer.h"
using namespace std;

extern "C" long threexplusone(long);

int main(){
  timer t; 
  long a = 0;
  long b = 0;
  long c = 0;
  float avg = 0;
  cout << "Insert number of runs:" << endl;
  cin >> c;
  cout << "Insert a number:" << endl;
  cin >> a;
  for(int i =0 ; i< c ; i++){
    t.start();
    b = threexplusone(a);
    t.stop();
    avg += t.getTime();
    cout << "Number of iterations: " <<  b << endl;
    cout << "Time: " << t.getTime() << endl;
  }
  cout << "Average time: " << avg/c << endl; 
  return 0;
}
