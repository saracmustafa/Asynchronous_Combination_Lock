# Asynchronous_Combination_Lock

💻  Fall 2016 ELEC 204 Digital Systems Design Term Project, Koç University

**Description:** In this project, i had implemented an asynchronous combination lock which has four two-bit inputs. As an input is given at each step, it either cycles its step or goes to the new state by checking its value with defined password. In addition to these, i added a RESET property, which works for locking the system. Then, the combination lock starts from the beginning again.

You can test this program on a programmable chip such as **FPGA board**.

According to the project, my password is **00 | 01 | 10 | 11**

**‘00’** is step one, **‘01’** is step two, **‘10’** is step three and **‘11’** is step four. 

If reset is **‘1’**, it return to the step one. If reset equals to **‘0’**, and clock is **‘1’** and inputs are true, it goes on step by step. When reset is **‘0’**, clock is **‘1’** , if I enter the values incorrectly for inputs, it return to the step one. If all steps are true, my decoded output turn up. 

**For more detailed questions, you can contact me at this email address: msarac13@ku.edu.tr**&nbsp;&nbsp;   ✉️

