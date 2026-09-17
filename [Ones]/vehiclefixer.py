import os
import random


def main():
    

    startDir = os.getcwd()
    count = 0
    for root, dir, files in os.walk("."):
        for file in files:
            if file == "handling.meta":
                modPack = root
                os.chdir(root)
                outFile = open('temp.txt', 'w')
                oFile = open("handling.meta","r")
                for lines in oFile.readlines():
                    dontPrint = 'false'
                    lookingfor = '<fDriveInertia' or 'fDriveInertia'
                    replace = '\t  <fDriveInertia value="1.00000" />\n'
                    if lookingfor in lines:
                        outFile.write(replace)
                        dontPrint = 'true'
                    lookingfor2 = '<fInitialDriveForce' or 'fInitialDriveForce'
                    replace2 = '\t  <fInitialDriveForce value="0.40000" />\n'
                    if lookingfor2 in lines:
                        outFile.write(replace2)
                        dontPrint = 'true'
                    lookingfor3 = '<fInititialDragCoeff' or 'fInititialDragCoeff'
                    replace3 = '\t  <fInititialDragCoeff value="8.00000" />\n'
                    if lookingfor3 in lines:
                        outFile.write(replace3)
                        dontPrint = 'true'
                    lookingfor4 = '<fInitialDriveMaxFlatVel' or 'fInitialDriveMaxFlatVel'
                    replace4 = '\t  <fInitialDriveMaxFlatVel value="200.000000" />\n'
                    if lookingfor4 in lines:
                        outFile.write(replace4)
                        dontPrint = 'true'
                    if dontPrint == 'false':
                        outFile.write(lines)
                oFile.close()
                outFile.close()
##                oFile = open('temp.txt', 'r')
##                outFile = open('handling.meta', 'w')
                count+=1 
##                for lines in oFile.readlines():
##                    outFile.write(lines)
                    
                oFile.close()
                outFile.close()    
                print(modPack)
                os.chdir(startDir)   
    print(count)
main()
 
