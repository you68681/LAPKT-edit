(define (problem BLOCKS-7-2)
(:domain BLOCKS)
(:objects E G C D F A B - block)
(:INIT (CLEAR B) (CLEAR A) (ONTABLE F) (ONTABLE D) (ON B C) (ON C G) (ON G E)
 (ON E F) (ON A D) (HANDEMPTY))
(:goal (AND (ON E B) (ON B F) (ON F D) (ON D A) (ON A C) (ON C G) (ONTABLE G)))
)
