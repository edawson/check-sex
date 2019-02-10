xcov=$(echo "scale=4; $(samtools idxstats $1 | grep "X" | cut -f 3)/$(samtools idxstats $1 | grep "X" | cut -f 2)" | bc)
ycov=$(echo "scale=4; $(samtools idxstats $1 | grep "Y" | cut -f 3)/$(samtools idxstats $1 | grep "Y" | cut -f 2)" | bc)
rat=$(echo "scale=4; ${xcov}/${ycov}" | bc)
echo "X:Y ratio: $rat"
