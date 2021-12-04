import sys
class Board:
    def __init__(self,inputs,no):
        self.boardno=no
        self.__board=list(map(int ,inputs.split()))
        self.__elems=list(map(int,inputs.split()))
        self.rows={0:0,1:0,2:0,3:0,4:0}
        self.columns={0:0,1:0,2:0,3:0,4:0}

    def enter(self,num):
        try:
            pos=self.__board.index(num)
        except:
            return
        x=pos//5
        self.rows[x]+=1
        y=pos%5
        self.columns[y]+=1
        self.__elems[pos]=0
        #print(x,y,self.rows,self.columns)
        if any(map(lambda x:x>=5,self.rows.values())) or any(map(lambda x:x>=5,self.columns.values())):
            print("probable ans = ",sum(self.__elems),",",num)
            return sum(self.__elems) * num


        
    def showBoard(self):
        print("\nBoard number #"+str(self.boardno))
        print("Problem:")
        for x in range(5):
            for y in range(5):
                print(str(self.__board[x*5+y]).rjust(2),end=" ")
            print()

        print("="*14)
        print("Solution:")
        for x in range(5):
            for y in range(5):
                print(str(self.__elems[x*5+y]).rjust(2),end=" ")
            print()


with open("input.txt","r") as infile:
    data= infile.read()


entries = data.split("\n\n")

inputs=list(map(int,entries[0].split(",")))

boards= [Board(x,i) for i,x in enumerate(entries[1:])]

firstFound=False
for inp in inputs:
    for board in boards:
        x = board.enter(inp)
        if (x):
            board.showBoard()
            if(not firstFound):
                print("#1 solution =",x)
                firstFound=True
            if(firstFound):
                if(len(boards)==1):
                    print("#2 solution = ",x)
                    sys.exit(0)
            boards.remove(board)


