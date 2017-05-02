# -*- coding: utf-8 -*-
"""
Created on Thu Apr 20 15:34:53 2017

@author: wux6si
"""
import os, shutil

for i in range(1,7):
    # get the filename and the length
    source_path = 'C:\\daten\\Temp\\eUPs_messzelle\\Test\\MicEM\\T%d\\' % i
    lst = os.listdir(source_path)
    lst.sort()
    filename = lst[0]
    time = filename.split('_')
    mytime = time[1] + '_' + time[2]
    mylen = len(lst)
    
    # prepare the data list
    data_path = 'C:\\daten\\Temp\\eUPs_messzelle\\Umgebung\\MicMRVL\\Data' # change mic name
    lst_data = os.listdir(data_path)
    lst_data.sort()
    index = 0
    temp = []
    lst_uhrzeit = []
    for file in lst_data:
        temp = file.split('_')
        lst_uhrzeit.append(temp[1] + '_' + temp[2])
    
    # compare and find the file
    index = 0
    for uhrzeit in lst_uhrzeit:
        if mytime == uhrzeit:
            break
        else:
            index = index + 1
    
    # copy the file
    target_path = 'C:\\daten\\Temp\\eUPs_messzelle\\Test\\MicMRVL\\T%d\\' % i # change mic name
    os.mkdir(target_path)
    for sequence in range(index, index + mylen):
        shutil.copy(os.path.abspath(data_path + '\\' + lst_data[sequence]), target_path)
