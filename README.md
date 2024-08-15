# DigiSort App

## Overview
This is a Flutter application designed to sort numbers utilizing the selection sort algorithm. Flutter is an open-source UI software development kit created by Google, used to develop cross-platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase.

## Algorithm
```
 int n = arr.length;
        // One by one move boundary of subarray
        for (int i = 0; i < n-1; i++)
        {
            // Find the minimum element
            int min = i;
            for (int j = i+1; j < n; j++)
                if (arr[j] < arr[min])
                    min_idx = j;
            // Swap the found minimum element with the first element
            int temp = arr[min];
            arr[min] = arr[i];
            arr[i] = temp;
        }
```
## Screenshots

<img src="1.jpg" height="1134.5px" width="540px">
![](2.jpg =250x250)
