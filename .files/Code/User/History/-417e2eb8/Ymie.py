age = input("Please enter your age\n")
age_fix = int(age)
rental_age = 25
license_age = 16
if age_fix >= rental_age:
    print("you can apply to rent a car")
    if age_fix == 25:
        print("you have to pay a premium for insurance")
elif age_fix >= license_age:
    print("you can apply for a license")
else:
    print("you cannot apply for anything")
