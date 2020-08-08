L = [[[2, 1, 1]], [[1, 2, 1]], [[1, 1, 2]], [], [], [], [], [], [], []]

for Crrt in range(6):  # Current Q&A
    for Prvs in range(max(0, Crrt - 2), Crrt):  # Previous 2 Q&A's
        for Case in range(len(L[Prvs])):
            Decidable = [0, 0, 0]
            for Guy in range(3):
                if Guy != Crrt % 3:
                    Decidable[Guy] = L[Prvs][Case][Guy]
                    Decidable[Crrt % 3] += L[Prvs][Case][Guy]
            L[Crrt].append(Decidable)

for k in L:
    print(k)
L[5]
