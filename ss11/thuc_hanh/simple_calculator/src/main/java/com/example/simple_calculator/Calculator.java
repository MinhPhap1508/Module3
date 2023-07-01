package com.example.simple_calculator;

public class Calculator {
    public static float calculate(float firstOperand,float secondOperand, char operator) {
        switch (operator) {
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if (secondOperand !=0) {
                    return firstOperand/secondOperand;
                } else {
                    throw new RuntimeException("Can not divide by zero. Second Operator must different from zero");
                }
            default:
                throw new RuntimeException("Invalid operator");
        }

    }
}
