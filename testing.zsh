function test_colors() {
	color=0
	while [[ $color -lt 256 ]]; do
		print -Pn "%K{$color} $color %k"
		color=$((color + 1))
	done
	print
}
