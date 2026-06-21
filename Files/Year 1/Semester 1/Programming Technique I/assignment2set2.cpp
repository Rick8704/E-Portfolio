//TANZHIMING A23CS0189 NGYUHIN A23CS0148
#include <iostream>
using namespace std;

int main(){
    int x;
    char y='$';
    cout<<"Welcome to the Food Ordering System"<<endl;
    cout<<"1.Pizza - $10\n"
        <<"2.Burger -$5\n"
        <<"3.Sandwich - $7\n";
    cout<<"Enter the number of the item you want to order:";
    cin>>x;

    if(x==1){
        x=10;
    }
    else if(x==2){
        x=5;
    }
    else if(x==3){
        x=7;
    }
    else{
        x=0;
        cout<<"No items ordered."<<endl;
    }
    cout<<"Your total bill is: "<<y<<x<<"\n"<<endl;
    cout<<"--------------------------------"<<endl;
    system("pause");
    return 0;
}