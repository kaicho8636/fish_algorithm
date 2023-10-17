source algorithm.fish

set n 10

for i in (seq $n)
	set testheap (insert (random) $testheap)
end
while set --query testheap[1]
	echo $testheap[1]
	set testheap (deletemin $testheap)
end
