with open("input.txt", "r") as infile:
    data= infile.read()

nums= list(map(int,data.split()))
def countIncrements(nums):
    count=0
    for (x,y) in zip(nums,nums[1:]):
        if (y>x):
            count+=1
    return count

def makeSliding(nums):
    return [x+y+z for x,y,z in zip (nums, nums [1:],nums[2:])]


print("#1st solution=",countIncrements(nums))
print("#2nd solution=",countIncrements(makeSliding(nums)))


