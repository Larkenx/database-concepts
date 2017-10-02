import os
import re
path = os.getcwd()

def format_sql_input(fname):
    f = open(fname, "r")
    rows = [x.strip('\n') for x in f.readlines()]
    f = open(fname[:-4]+"_formatted.txt", "w")
    for r in rows:
        data = r.split('\t')
        dataw = []
        for item in data:
            if re.match("\d", item) is None:
                item = "'" + item + "'"
            dataw.append(item)

        dataw = reduce(lambda x,y: x + ", " + y, dataw[1:], dataw[0])
        f.write("(" + dataw + "),\n")
    f.close()

format_sql_input(path + "/reserves.txt")
format_sql_input(path + "/boat.txt")
format_sql_input(path + "/sailor.txt")
