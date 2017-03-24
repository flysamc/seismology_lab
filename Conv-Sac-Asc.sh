sac<<!
convert from sac For_1.6-a.sac to alpha For_1.6-a.sac.a
q
!
begintime=-5
delta=0.05
awk 'NR > 30 { print $0 }' For_1.6-a.sac.a |  awk '{ i=1; while (i<NF+1) { print $i; ++i }}' | awk '{ print '$begintime' + '$delta'*(NR-1), $1 }' | awk '{ print $1, "0", $2 }' 
