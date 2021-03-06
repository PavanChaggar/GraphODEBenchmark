using LightGraphs
using SimpleWeightedGraphs
using DelimitedFiles

function MakeSimpleWeightedGraph(n::Int64, p::Float64)
    GW = SimpleWeightedGraph(erdos_renyi(n, p))
    for e in edges(GW)
        add_edge!(GW, src(e), dst(e), rand())
    end
    GW |> laplacian_matrix |> Array
end

N = 100
P = 0.1
L = MakeSimpleWeightedGraph(N, P)

writedlm("graphs/ER-$(N)-05.csv", L, ',')