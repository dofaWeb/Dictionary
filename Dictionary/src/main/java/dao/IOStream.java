/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Scanner;
import model.Dictionary;

/**
 *
 * @author NHAT
 */
public class IOStream {

    String fo = "src/Data.txt";

    public ArrayList<Dictionary> read() {
        ArrayList<Dictionary> dictList = new ArrayList<>();

        // Get the input stream
        InputStream fi = Thread.currentThread().getContextClassLoader().getResourceAsStream("Data.txt");

        if (fi == null) {
            System.out.println("File not found");
            return dictList;
        }

        try ( Scanner sc = new Scanner(fi)) {
            int n = Integer.parseInt(sc.nextLine());
            String Eng;
            String Vn;
            for (int i = 0; i < n; i++) {
                Eng = sc.nextLine();
                Vn = sc.nextLine();
                dictList.add(new Dictionary(Eng, Vn));
            }

            return dictList;
        }
    }

    public int Trigger() {
        int a = 1;
        return a;
    }

//    public void printResult() {
//        try {
//            FileWriter fw = new FileWriter(fo);
//            //--END FIXED PART----------------------------
//
//            //OUTPUT - @STUDENT: ADD YOUR CODE FOR OUTPUT HERE:
//            fw.write(result);
//
//            //--FIXED PART - DO NOT EDIT ANY THINGS HERE--
//            //--START FIXED PART-------------------------- 
//            fw.flush();
//            fw.close();
//        } catch (IOException ex) {
//            System.out.println("Output Exception # " + ex);
//        }
//    }
}
