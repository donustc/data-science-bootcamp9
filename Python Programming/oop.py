# OOP = Object Oreinted Programming
# class ATM

import random

class ATM:
  def __init__(self, account_name, bank_name, initial): 
      self.account_name = account_name  
      self.bank_name = bank_name
      self.balance = initial

  def __str__(self):
      return f'This is an account of {self.account_name}, bank: {self.bank_name}'
  
  # method 
  def check_balance(self):
      print(f'Balance: {self.balance} THB')

  def deposit(self, money):
      self.balance += money # self.balance + money
      print(f'Deposit successfully: your new balance: {self.balance} THB')
    
  def withdraw(self, money):
      self.balance -= money
      print(f'Withdraw successfully: your new balance: {self.balance} THB')

  def get_OTP(self):
      otp = random.randint(1000, 9999)
      print(f'OTP: {otp} This OTP will expired in 2 minutes.')
