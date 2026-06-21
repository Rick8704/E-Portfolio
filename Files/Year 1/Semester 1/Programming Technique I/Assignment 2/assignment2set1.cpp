//TANZHIMING A23CS0189 NGYUHIN A23CS0148
#include <iostream>
using namespace std;

void displayAccountInfo(string, int, double);
void deposit(double& , double=500);
void withdraw(double& , double=200);

int main() {

string name = "User 1";
    int accNum = 1013202341;
    double balance = 200 ;
    char choice='Y';

    do{
        cout << "<<<<< My Accounts Overview >>>>>" << endl;
        displayAccountInfo(name,accNum,balance);

        cout<<"\n\n<<<<< Deposit Transaction >>>>>" << endl;
        deposit(balance);

        cout<<"\n\n<<<<< Withdrawal Transaction >>>>>" << endl;
        withdraw(balance);

        cout << "\n\n<<<<< My Accounts Overview >>>>>" << endl;
        displayAccountInfo(name,accNum,balance);

        cout<<"\n\nDo you want to perform another transaction? (Y/N) : ";
        cin>>choice;
        cout<<"\n\n";

    }while(choice!='N');

    system("pause");
    return 0;
}

void displayAccountInfo(string name,int accNum, double balance) {
    cout << "Account Holder Name: " << name << endl;
    cout << "Account Number: " << accNum << endl;
    cout << "Balance: RM " << balance << endl;
}

void deposit(double& bal, double dep) {
    bal += dep;
    cout<<"Deposit of RM 500 successful"<<endl;
}

void withdraw(double& bal, double amount) {
    if (bal >= amount){
        bal -= amount;
        cout<<"Withdrawal of RM 200 successful"<<endl;
    }else
         cout<<"Insufficient funds for withdrawal"<<endl;

}
