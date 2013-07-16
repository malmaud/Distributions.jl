using Distributions
using Base.Test

const n_samples = 5_000_001


for d in [
	Dirichlet(3, 2.0), 
	Dirichlet([2.0, 1.0, 3.0])]

	println(d)
	dmean = mean(d)
	dcov = cov(d)

	x = rand(d, n_samples)
	xmean = vec(mean(x, 2))
	z = x .- xmean
	xcov = (z * z') * (1 / n_samples)

	println("expected mean  = $dmean")
	println("empirical mean = $xmean")
	println("--> abs.dev = $(max(abs(dmean - xmean)))")

	println("expected cov  = $dcov")
	println("empirical cov = $xcov")
	println("--> abs.dev = $(max(abs(dcov - xcov)))")

	println()
end
