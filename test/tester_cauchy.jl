# Ecrire les tests de l'algorithme du pas de Cauchy
using Test


function tester_cauchy(cauchy::Function)


    g1 = [1;0]
    H1 = [1 0 ; 0 1]
    delta11 = 0.5
    delta12 = 2

    H2 = [-1 0;0 1]

    H3 = [0 0; 1 0]
    
    gnul = [0; 0]

    tol_erreur = sqrt(eps())

	@testset "Pas de Cauchy" begin
        @testset "Cas a>0" begin
            @testset "Si min ∈ Δ" begin
                @test cauchy(g1, H1, delta11) ≈ [-0.5;0] atol=tol_erreur
            end
            @testset "Si min ∉ Δ" begin
                @test cauchy(g1, H1, delta12) ≈ [-1;0] atol=tol_erreur
            end
        end
        @testset "Cas a < 0" begin
            @test cauchy(g1, H2, delta11) ≈ [-0.5;0] atol=tol_erreur
            @test cauchy(g1, H2, delta12) ≈ [-2;0] atol=tol_erreur
        end
        @testset "Cas a = 0" begin
            @test cauchy(g1, H3, delta11) ≈ [-0.5;0] atol=tol_erreur
            @test cauchy(g1, H3, delta12) ≈ [-2;0] atol=tol_erreur
        end
        @testset "Cas g = 0" begin
            @test cauchy(gnul, H3, delta11) ≈ [0;0] atol=tol_erreur
            @test cauchy(gnul, H2, delta11) ≈ [0;0] atol=tol_erreur
            @test cauchy(gnul, H1, delta12) ≈ [0;0] atol=tol_erreur
        end

    end

end