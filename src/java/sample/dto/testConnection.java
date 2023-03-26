/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dto;

import java.util.ArrayList;
import sample.dao.AccountDAO;

/**
 *
 * @author PHAT
 */
public class testConnection {

    public static void main(String[] args) {
        //Workshop 1
        Account acc = AccountDAO.getAccount("test@gmail.com", "test");
        System.out.println(acc);
        if(acc != null){
            if(acc.getRole() == 1){
                System.out.println("I am an admin");
            }
            else 
                System.out.println("I am a user");
        }
        else{
            System.out.println("login fail");
        }
//        Test the first challenge
        ArrayList<Account> accList = AccountDAO.getAccounts();
        for(Account account : accList){
            System.out.println(acc);
        }
//        Test the second challenge
        if(AccountDAO.updateAccountStatus("test@gmail.com",1)){
            System.out.println("update status successfully");
        } else{
            System.out.println("cannot update status");
        }
//        Test the third challenge
        if (AccountDAO.updateAccount("test@gmail.com", "123456", "tester", "456789")) {
            System.out.println("update profile");
        } else{
            System.out.println("update profile fail");
        }
//        Test the fourth challenge
        if(AccountDAO.insertAccount("test2@gmail.com", "111111", "tester2", "01010101",1,0)){
            System.out.println("added new account");
        }else{
            System.out.println("insert a new account fail");
        }
    }
}
