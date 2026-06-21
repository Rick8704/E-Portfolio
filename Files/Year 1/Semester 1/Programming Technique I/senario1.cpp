#include <iostream>
#include <iomanip>
#include <cstring>
using namespace std;

double calculateKeywordPercentage(char[],int,int);

int main(){

    const int MAX_SIZE=1000;
    char userInput[MAX_SIZE];
    int Totalchar,Totalword=0;

    cout<<"Enter the input(up to 999 characters, end with an empty line): "<<endl;
    cin.getline(userInput,MAX_SIZE);

    for (Totalchar=0;Totalchar,MAX_SIZE;Totalchar++){
        if(userInput[Totalchar] == 0){
            break;
        }
    }

    for(int a=0; a<Totalchar; a++){
        if(userInput[a] != ' '){
            if(a == 0 || userInput[a-1]==' '){
                Totalword++;
            }
        }
    }
    cout<<"Input:"<<endl;
    for(int i=0;i<Totalchar;i++){
        cout<<userInput[i];
    }
    double result=calculateKeywordPercentage(userInput,Totalchar,Totalword);
    cout<<fixed<<setprecision(2);
    cout<<"\nPercentage of lines containing 'data': "<<result<<"%"<<endl;

    system ("pause");
    return 0;
}

double calculateKeywordPercentage(char userInput[],int Totalchar,int Totalword){
    char keyword[]="data";
    double Keynum = 0.0;
    double average;

    for(int j=0; j<Totalchar; j++){
        if(strstr((userInput+j),keyword) == (userInput+j)){
            Keynum++;
        }
        keyword[0]=toupper(keyword[0]);

        if (strstr((userInput+j),keyword) == (userInput+j)){
            Keynum++;
        }
        keyword[0]=tolower(keyword[0]);

    }
    average=(Keynum/Totalword)*100;
    return average;
}