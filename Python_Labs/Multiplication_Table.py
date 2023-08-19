for y in range(1, 11):
    print(f"", end=" ")
    for x in range(1, 11):
        print(f'{y * x:3d}', end="|")
    print()
