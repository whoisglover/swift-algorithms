// Danny Glover


//mergesort function

//input: unsorted array

//base case
// if size == 1 return array

// split array 0..n/2 and n/2+1..n
// call mergesort on 1st array
// call mergesort on 2nd array
// call merge function, pass 1st and 2nd array


//merge function input: two arrays
// create new result array
// while both left and right arrays have values:
// compare first element of each
// if left element is greater add to result array and remove from left array
// if right element is greater add to result array and remove from right array
// if equal add both to result array and remove both

// once one is empty, run a while loop to empty the elements from remaining array into result

// while left is not empty
// add first element of left array to result array and remove from left array

//while right is not empty 
// add first element of right array to result array and remove from right

//UPDATE: no need to check if right is larger or equal after left shows it is not less than right


// log(n)
func mergesort(inputArray: Array<Int>) -> Array<Int> {
    
    guard inputArray.count > 1 else {return inputArray}
    
    let middle = inputArray.count / 2
    let leftArray = mergesort(inputArray: Array(inputArray[0..<middle]))
    let rightArray = mergesort(inputArray: Array(inputArray[middle..<inputArray.count]))
    return merge(leftArray: leftArray, rightArray: rightArray)
    
}



// most comparisons n/2
func merge(leftArray: Array<Int>, rightArray: Array<Int>) -> Array<Int> {
    
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray = [Int]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            orderedArray.append(leftArray[leftIndex])
            leftIndex += 1
        } else  {
            orderedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
        
        //no need for checking equal, if left is not smaller put right in and move on 
        
//        if leftArray[leftIndex] > rightArray[rightIndex]
//        else {
//            orderedArray.append(leftArray[leftIndex])
//            leftIndex += 1
//            orderedArray.append(rightArray[rightIndex])
//            rightIndex += 1
//        }
    }
    
    while leftIndex < leftArray.count {
        orderedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightArray.count {
        orderedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }

    return orderedArray
}


let x = [14,33,27,27,27,10,35,19,42,44, 0]

let z = mergesort(inputArray: x)
print(z)
