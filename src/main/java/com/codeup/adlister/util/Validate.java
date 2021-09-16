package com.codeup.adlister.util;


import com.codeup.adlister.dao.DaoFactory;

public class Validate {

    public static boolean passwordIsNotValid(String str) {
        char ch;
        boolean capitalFlag = false;
        boolean lowerCaseFlag = false;
        boolean numberFlag = false;
        boolean sixCharacters = str.length() >= 6;
        for(int i=0;i < str.length();i++) {
            ch = str.charAt(i);
            if( Character.isDigit(ch)) {
                numberFlag = true;
            }
            else if (Character.isUpperCase(ch)) {
                capitalFlag = true;
            } else if (Character.isLowerCase(ch)) {
                lowerCaseFlag = true;
            }
            if(numberFlag && capitalFlag && lowerCaseFlag && sixCharacters)
                return false;
        }
        return true;
    }

    public static boolean emailIsNotValid(String email) {
        String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        return !email.matches(regex);
    }

    public static boolean usernameIsNotUnique(String username){
        return DaoFactory.getUsersDao().findByUsername(username) != null;
    }

}
