// Assignment 1 - SECJ2013 - 23241 (Assg1.cpp)
// Group Members:
// 1. NG YU HIN A23CS0148
// 2. NEO LI XIN A23CS0253
// 3. 

#include <iostream>
#include <string>
#include <fstream>
#include "Student.h"

using namespace std;

// function headers
void listStudent(Student* [], int);
void sortByName(Student* [], int);
void sortByGrade(Student* [], int);

// main function
int main() {
    const int LIST_SIZE = 10;
    string name;
    int cw, fe, idx = 0;
    Student* studList[LIST_SIZE];

    fstream fileIn("Marks.txt", ios::in);

    if (!fileIn) {
        cout << "File input/output error!\n";
        return 1;

    } else {
        while (fileIn >> name >> cw >> fe) {
            studList[idx] = new Student(name, cw, fe);
            idx++;
        }
        
        int opt = 0;

        while (opt != 4) {
            cout << "\n1. List results (original list)";
            cout << "\n2. List results (sort by name)";
            cout << "\n3. List results (sort by grade)";
            cout << "\n4. Exit\n\n";
            
            cout << "Enter your choice [1, 2, 3, 4]: ";
            cin >> opt;
            
            if (opt == 1) {
                listStudent(studList, idx);
            }
            
            else if (opt == 2) {
                sortByName(studList, idx);
                listStudent(studList, idx);
            }

            else if (opt == 3) {
                sortByGrade(studList, idx);
                listStudent(studList, idx);
            }

            if (opt != 4) system("pause");
        }

        fileIn.close();
    }
    system("pause");
    return 0;
}

// function implementation
void listStudent(Student* sl[], int size) {
    for (int pass = 0; pass < size; pass++) {
        sl[pass]->printResult();
    }
}

void sortByName(Student* sl[], int size) {
    for (int pass = 1; pass < size ; pass++) {
        for (int x = 0; x < size - pass ; x++) {
            if (sl[x]->getName() > sl[x + 1]->getName()) {
                Student* temp = sl[x];
                sl[x] = sl[x + 1];
                sl[x + 1] = temp;
            }
        }
    }
}

void sortByGrade(Student* sl[], int size) {
    for (int pass = 1; pass < size ; pass++) {
        for (int i = 0; i < size - pass ; i++) {
            string grade1 = sl[i]->getGrade();
            string grade2 = sl[i + 1]->getGrade();
            char firstLetterA = sl[i]->getName()[0];
            char firstLetterB = sl[i + 1]->getName()[0];

            // If grades are different, sort by grade (descending order).
            if (grade1 != grade2) {
                if (grade1 > grade2) {  // Higher grade first
                    Student* temp = sl[i];
                    sl[i] = sl[i + 1];
                    sl[i + 1] = temp;
                }
            }
            // If grades are the same, sort by name's first letter (ascending order).
            else if (firstLetterA > firstLetterB) {
                Student* temp = sl[i];
                sl[i] = sl[i + 1];
                sl[i + 1] = temp;
            }
        }
    }
}