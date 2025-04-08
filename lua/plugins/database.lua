return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    build = function()
        require("dbee").install()
    end,
    config = function()
        require("dbee").setup({
            sources = {
                require("dbee.sources").FileSource:new(vim.fn.findfile("database.json")),
            },
            directory = function()
                local scratchpad = os.getenv("SCRATCHPAD")
                if scratchpad == nil or scratchpad == "" then
                    return "/tmp"
                else
                    return scratchpad
                end
            end,
            extra_helpers = {
                ["postgres"] = {
                    ["Internações Paciente"] = [[
                        SELECT pac.prontuario, int.dthr_alta_medica, int.dt_saida_paciente
                               int.tam_codigo, int.lto_lto_id, atd.lto_lto_id
                        FROM agh.ain_internacoes int
                        JOIN agh.aip_pacientes pac ON int.pac_codigo = pac.codigo
                        JOIN agh.agh_atendimentos atd ON atd.int_seq = int.seq
                        WHERE pac.prontuario = :prontuario
                        ;
                    ]],
                    ["Servidores"] = [[
                        SELECT    ser.matricula, ser.vin_codigo, pes.nome
                        FROM agh.rap_servidores ser
                        JOIN agh.rap_pessoas_fisicas pes ON ser.pes_codigo = pes.codigo
                        WHERE 1 = 1
                        AND (
                            AND ser.matricula = :matricula
                            AND ser.vin_codigo = :vinculo
                        ) OR (
                            pes.nome ILIKE '%' || :nome || '%'
                        )
                        ;
                    ]],
                    ["Validação Consulta"] = [[
                        SELECT con.numero, con.dt_consulta, pes.nome AS validado_por
                        FROM agh.aac_consultas con
                        LEFT JOIN (
                            SELECT con_numero, ser_matricula_valida, ser_vin_codigo_valida
                            FROM agh.mam_anamneses ana
                            UNION
                            SELECT con_numero, ser_matricula_valida, ser_vin_codigo_valida
                            FROM agh.mam_evolucoes evo
                        ) AS cx ON cx.con_numero = con.numero
                        JOIN agh.rap_servidores ser ON cx.ser_matricula_valida = ser.matricula
                        AND cx.ser_vin_codigo_valida = ser.vin_codigo
                        JOIN agh.rap_pessoas_fisicas pes ON ser.pes_codigo = pes.codigo 
                        WHERE con.numero = :numero_consulta
                        ;
                    ]],
                    ["Sumário Alta"] = [[
                        SELECT *
                        FROM agh.mpm_alta_sumarios
                        WHERE prontuario = :prontuario
                        AND ind_concluido = :concluido
                        AND ind_situacao = :situacao
                        ;
                    ]],
                },
            },
        })
    end,
}
