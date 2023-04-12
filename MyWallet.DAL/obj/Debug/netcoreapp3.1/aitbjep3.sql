IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Funcoes] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [Descricao] nvarchar(50) NOT NULL,
    CONSTRAINT [PK_Funcoes] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Mes] (
    [MesId] int NOT NULL IDENTITY,
    [Nome] nvarchar(20) NOT NULL,
    CONSTRAINT [PK_Mes] PRIMARY KEY ([MesId])
);

GO

CREATE TABLE [Tipos] (
    [TipoId] int NOT NULL IDENTITY,
    [Nome] nvarchar(20) NOT NULL,
    CONSTRAINT [PK_Tipos] PRIMARY KEY ([TipoId])
);

GO

CREATE TABLE [Usuarios] (
    [Id] nvarchar(450) NOT NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    [CPF] nvarchar(20) NOT NULL,
    [Profissao] nvarchar(30) NOT NULL,
    [Foto] varbinary(max) NULL,
    CONSTRAINT [PK_Usuarios] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AspNetRoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetRoleClaims_Funcoes_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Funcoes] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Categorias] (
    [CategoriaId] int NOT NULL IDENTITY,
    [Nome] nvarchar(50) NOT NULL,
    [Icone] nvarchar(15) NOT NULL,
    [TipoId] int NOT NULL,
    CONSTRAINT [PK_Categorias] PRIMARY KEY ([CategoriaId]),
    CONSTRAINT [FK_Categorias_Tipos_TipoId] FOREIGN KEY ([TipoId]) REFERENCES [Tipos] ([TipoId]) ON DELETE CASCADE
);

GO

CREATE TABLE [AspNetUserClaims] (
    [Id] int NOT NULL IDENTITY,
    [UserId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUserClaims_Usuarios_UserId] FOREIGN KEY ([UserId]) REFERENCES [Usuarios] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AspNetUserLogins] (
    [LoginProvider] nvarchar(450) NOT NULL,
    [ProviderKey] nvarchar(450) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_Usuarios_UserId] FOREIGN KEY ([UserId]) REFERENCES [Usuarios] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AspNetUserRoles] (
    [UserId] nvarchar(450) NOT NULL,
    [RoleId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_Funcoes_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Funcoes] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_Usuarios_UserId] FOREIGN KEY ([UserId]) REFERENCES [Usuarios] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AspNetUserTokens] (
    [UserId] nvarchar(450) NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_Usuarios_UserId] FOREIGN KEY ([UserId]) REFERENCES [Usuarios] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Cartoes] (
    [CartaoId] int NOT NULL IDENTITY,
    [Nome] nvarchar(20) NOT NULL,
    [Bandeira] nvarchar(15) NOT NULL,
    [Numero] nvarchar(20) NOT NULL,
    [Limite] float NOT NULL,
    [UsuarioId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_Cartoes] PRIMARY KEY ([CartaoId]),
    CONSTRAINT [FK_Cartoes_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([Id])
);

GO

CREATE TABLE [Ganhos] (
    [GanhoId] int NOT NULL IDENTITY,
    [Descricao] nvarchar(50) NOT NULL,
    [CategoriaId] int NOT NULL,
    [Valor] float NOT NULL,
    [Dia] int NOT NULL,
    [MesId] int NOT NULL,
    [Ano] int NOT NULL,
    [UsuarioId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_Ganhos] PRIMARY KEY ([GanhoId]),
    CONSTRAINT [FK_Ganhos_Categorias_CategoriaId] FOREIGN KEY ([CategoriaId]) REFERENCES [Categorias] ([CategoriaId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Ganhos_Mes_MesId] FOREIGN KEY ([MesId]) REFERENCES [Mes] ([MesId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Ganhos_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([Id])
);

GO

CREATE TABLE [Despesas] (
    [DespesaId] int NOT NULL IDENTITY,
    [CartaoId] int NOT NULL,
    [Descricao] nvarchar(50) NOT NULL,
    [CategoriaId] int NOT NULL,
    [Valor] float NOT NULL,
    [Dia] int NOT NULL,
    [MesId] int NOT NULL,
    [Ano] int NOT NULL,
    [UsuarioId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_Despesas] PRIMARY KEY ([DespesaId]),
    CONSTRAINT [FK_Despesas_Cartoes_CartaoId] FOREIGN KEY ([CartaoId]) REFERENCES [Cartoes] ([CartaoId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Despesas_Categorias_CategoriaId] FOREIGN KEY ([CategoriaId]) REFERENCES [Categorias] ([CategoriaId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Despesas_Mes_MesId] FOREIGN KEY ([MesId]) REFERENCES [Mes] ([MesId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Despesas_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([Id])
);

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'e7444c36-5bf4-4e06-8fe1-ef195ef296e1', N'9a5bc06e-7916-4773-8b31-a69d671864db', N'Administrador do Sistema', N'Administrador', N'ADMINISTRADOR'),
(N'858aff6c-5d1f-437f-9733-21f045826ecc', N'07bfd32b-14d2-435f-a65a-230eb6a90008', N'Usuario do Sistema', N'Usuario', N'USUARIO');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'MesId', N'Nome') AND [object_id] = OBJECT_ID(N'[Mes]'))
    SET IDENTITY_INSERT [Mes] ON;
INSERT INTO [Mes] ([MesId], [Nome])
VALUES (1, N'Janeiro'),
(2, N'Fevereiro'),
(3, N'Março'),
(4, N'Abril'),
(5, N'Maio'),
(6, N'Junho'),
(7, N'Julho'),
(8, N'Agosto'),
(9, N'Setembro'),
(10, N'Outubro'),
(11, N'Novembro'),
(12, N'Dezembro');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'MesId', N'Nome') AND [object_id] = OBJECT_ID(N'[Mes]'))
    SET IDENTITY_INSERT [Mes] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'TipoId', N'Nome') AND [object_id] = OBJECT_ID(N'[Tipos]'))
    SET IDENTITY_INSERT [Tipos] ON;
INSERT INTO [Tipos] ([TipoId], [Nome])
VALUES (1, N'Despesa'),
(2, N'Ganho');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'TipoId', N'Nome') AND [object_id] = OBJECT_ID(N'[Tipos]'))
    SET IDENTITY_INSERT [Tipos] OFF;

GO

CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);

GO

CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);

GO

CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);

GO

CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);

GO

CREATE UNIQUE INDEX [IX_Cartoes_Nome] ON [Cartoes] ([Nome]);

GO

CREATE UNIQUE INDEX [IX_Cartoes_Numero] ON [Cartoes] ([Numero]);

GO

CREATE INDEX [IX_Cartoes_UsuarioId] ON [Cartoes] ([UsuarioId]);

GO

CREATE INDEX [IX_Categorias_TipoId] ON [Categorias] ([TipoId]);

GO

CREATE INDEX [IX_Despesas_CartaoId] ON [Despesas] ([CartaoId]);

GO

CREATE INDEX [IX_Despesas_CategoriaId] ON [Despesas] ([CategoriaId]);

GO

CREATE INDEX [IX_Despesas_MesId] ON [Despesas] ([MesId]);

GO

CREATE INDEX [IX_Despesas_UsuarioId] ON [Despesas] ([UsuarioId]);

GO

CREATE UNIQUE INDEX [RoleNameIndex] ON [Funcoes] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;

GO

CREATE INDEX [IX_Ganhos_CategoriaId] ON [Ganhos] ([CategoriaId]);

GO

CREATE INDEX [IX_Ganhos_MesId] ON [Ganhos] ([MesId]);

GO

CREATE INDEX [IX_Ganhos_UsuarioId] ON [Ganhos] ([UsuarioId]);

GO

CREATE UNIQUE INDEX [IX_Mes_Nome] ON [Mes] ([Nome]);

GO

CREATE UNIQUE INDEX [IX_Usuarios_CPF] ON [Usuarios] ([CPF]);

GO

CREATE INDEX [EmailIndex] ON [Usuarios] ([NormalizedEmail]);

GO

CREATE UNIQUE INDEX [UserNameIndex] ON [Usuarios] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220420210406_criacaoDB', N'3.1.24');

GO

ALTER TABLE [Categorias] DROP CONSTRAINT [FK_Categorias_Tipos_TipoId];

GO

DROP TABLE [Tipos];

GO

DROP INDEX [IX_Categorias_TipoId] ON [Categorias];

GO

DELETE FROM [Funcoes]
WHERE [Id] = N'858aff6c-5d1f-437f-9733-21f045826ecc';
SELECT @@ROWCOUNT;


GO

DELETE FROM [Funcoes]
WHERE [Id] = N'e7444c36-5bf4-4e06-8fe1-ef195ef296e1';
SELECT @@ROWCOUNT;


GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Categorias]') AND [c].[name] = N'TipoId');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Categorias] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Categorias] DROP COLUMN [TipoId];

GO

ALTER TABLE [Categorias] ADD [TipoMovimentacaoId] int NOT NULL DEFAULT 0;

GO

CREATE TABLE [Reservas] (
    [ReservaId] int NOT NULL IDENTITY,
    [Descricao] nvarchar(50) NOT NULL,
    [CategoriaId] int NOT NULL,
    [Valor] float NOT NULL,
    [Dia] int NOT NULL,
    [MesId] int NOT NULL,
    [Ano] int NOT NULL,
    [UsuarioId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_Reservas] PRIMARY KEY ([ReservaId]),
    CONSTRAINT [FK_Reservas_Categorias_CategoriaId] FOREIGN KEY ([CategoriaId]) REFERENCES [Categorias] ([CategoriaId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Reservas_Mes_MesId] FOREIGN KEY ([MesId]) REFERENCES [Mes] ([MesId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Reservas_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([Id])
);

GO

CREATE TABLE [TiposMovimentacao] (
    [TipoMovimentacaoId] int NOT NULL IDENTITY,
    [Nome] nvarchar(20) NOT NULL,
    CONSTRAINT [PK_TiposMovimentacao] PRIMARY KEY ([TipoMovimentacaoId])
);

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'f7451e11-2ef8-44d4-a38c-755e6e885655', N'4eab3356-66f6-40aa-b2c2-90ce489c9ce3', N'Administrador do Sistema', N'Administrador', N'ADMINISTRADOR');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'51ad58bb-1fbf-4afb-9899-5fb9907bf269', N'2cfdf219-25f5-4248-b49d-d3987eeaaa61', N'Usuario do Sistema', N'Usuario', N'USUARIO');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

CREATE INDEX [IX_Categorias_TipoMovimentacaoId] ON [Categorias] ([TipoMovimentacaoId]);

GO

CREATE INDEX [IX_Reservas_CategoriaId] ON [Reservas] ([CategoriaId]);

GO

CREATE INDEX [IX_Reservas_MesId] ON [Reservas] ([MesId]);

GO

CREATE INDEX [IX_Reservas_UsuarioId] ON [Reservas] ([UsuarioId]);

GO

ALTER TABLE [Categorias] ADD CONSTRAINT [FK_Categorias_TiposMovimentacao_TipoMovimentacaoId] FOREIGN KEY ([TipoMovimentacaoId]) REFERENCES [TiposMovimentacao] ([TipoMovimentacaoId]) ON DELETE CASCADE;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220521195227_mywalletv1', N'3.1.24');

GO

DELETE FROM [Funcoes]
WHERE [Id] = N'51ad58bb-1fbf-4afb-9899-5fb9907bf269';
SELECT @@ROWCOUNT;


GO

DELETE FROM [Funcoes]
WHERE [Id] = N'f7451e11-2ef8-44d4-a38c-755e6e885655';
SELECT @@ROWCOUNT;


GO

CREATE TABLE [Metas] (
    [IdMeta] int NOT NULL IDENTITY,
    [Descricao] nvarchar(50) NOT NULL,
    [IdTipoMovimentacao] int NOT NULL,
    [Valor] float NOT NULL,
    [Atingida] bit NOT NULL,
    [UsuarioId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_Metas] PRIMARY KEY ([IdMeta]),
    CONSTRAINT [FK_Metas_TiposMovimentacao_IdTipoMovimentacao] FOREIGN KEY ([IdTipoMovimentacao]) REFERENCES [TiposMovimentacao] ([TipoMovimentacaoId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Metas_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([Id])
);

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'a86db153-e521-4c9b-afbb-6ca4beb25cf1', N'd94a9902-abb0-4570-9f61-364a7375cef4', N'Administrador do Sistema', N'Administrador', N'ADMINISTRADOR');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'0b090610-cfef-48fe-b038-36516ce7e03b', N'6916686d-3e5d-4694-b285-a88ecdc2b426', N'Usuario do Sistema', N'Usuario', N'USUARIO');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

CREATE INDEX [IX_Metas_IdTipoMovimentacao] ON [Metas] ([IdTipoMovimentacao]);

GO

CREATE INDEX [IX_Metas_UsuarioId] ON [Metas] ([UsuarioId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220522164043_novasentidades', N'3.1.24');

GO

DELETE FROM [Funcoes]
WHERE [Id] = N'0b090610-cfef-48fe-b038-36516ce7e03b';
SELECT @@ROWCOUNT;


GO

DELETE FROM [Funcoes]
WHERE [Id] = N'a86db153-e521-4c9b-afbb-6ca4beb25cf1';
SELECT @@ROWCOUNT;


GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'3ae5cd17-c3bd-4232-ba92-eb4e69d3fa6d', N'60a0b98b-9f2d-43ed-b787-f6125a757d0c', N'Administrador do Sistema', N'Administrador', N'ADMINISTRADOR');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'b72688d5-f99a-4004-b21f-30b20525c3d9', N'ffcb50fc-5500-4329-911e-235041c7775a', N'Usuario do Sistema', N'Usuario', N'USUARIO');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220524234234_alteracoes', N'3.1.24');

GO

DELETE FROM [Funcoes]
WHERE [Id] = N'3ae5cd17-c3bd-4232-ba92-eb4e69d3fa6d';
SELECT @@ROWCOUNT;


GO

DELETE FROM [Funcoes]
WHERE [Id] = N'b72688d5-f99a-4004-b21f-30b20525c3d9';
SELECT @@ROWCOUNT;


GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Metas]') AND [c].[name] = N'Atingida');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Metas] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Metas] DROP COLUMN [Atingida];

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'7f963739-78ab-4588-a6d1-4bc67165c0aa', N'd6dad1de-5dba-4b56-bc09-ba8c02ffb7d7', N'Administrador do Sistema', N'Administrador', N'ADMINISTRADOR');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'a2099f3b-21af-47d6-a336-d110f210cf48', N'601a2a5d-e5b4-4166-9d91-67882323c089', N'Usuario do Sistema', N'Usuario', N'USUARIO');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220525151002_alteracaotbmeta', N'3.1.24');

GO

ALTER TABLE [Categorias] DROP CONSTRAINT [FK_Categorias_TiposMovimentacao_TipoMovimentacaoId];

GO

ALTER TABLE [Metas] DROP CONSTRAINT [FK_Metas_TiposMovimentacao_IdTipoMovimentacao];

GO

ALTER TABLE [TiposMovimentacao] DROP CONSTRAINT [PK_TiposMovimentacao];

GO

DROP INDEX [IX_Categorias_TipoMovimentacaoId] ON [Categorias];

GO

DELETE FROM [Funcoes]
WHERE [Id] = N'7f963739-78ab-4588-a6d1-4bc67165c0aa';
SELECT @@ROWCOUNT;


GO

DELETE FROM [Funcoes]
WHERE [Id] = N'a2099f3b-21af-47d6-a336-d110f210cf48';
SELECT @@ROWCOUNT;


GO

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TiposMovimentacao]') AND [c].[name] = N'TipoMovimentacaoId');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [TiposMovimentacao] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [TiposMovimentacao] DROP COLUMN [TipoMovimentacaoId];

GO

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Categorias]') AND [c].[name] = N'TipoMovimentacaoId');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Categorias] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [Categorias] DROP COLUMN [TipoMovimentacaoId];

GO

ALTER TABLE [TiposMovimentacao] ADD [IdTipoMovimentacao] int NOT NULL IDENTITY;

GO

ALTER TABLE [Categorias] ADD [IdTipoMovimentacao] int NOT NULL DEFAULT 0;

GO

ALTER TABLE [TiposMovimentacao] ADD CONSTRAINT [PK_TiposMovimentacao] PRIMARY KEY ([IdTipoMovimentacao]);

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'65d8a8fe-7282-4410-967c-4e6e9b670976', N'f38c4e29-2aef-4aca-bf48-462f34abc037', N'Administrador do Sistema', N'Administrador', N'ADMINISTRADOR');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] ON;
INSERT INTO [Funcoes] ([Id], [ConcurrencyStamp], [Descricao], [Name], [NormalizedName])
VALUES (N'a7ef168b-c770-4b3f-84ce-40f81089a905', N'a0c2dda0-97a1-4fdb-816c-af8cfd391003', N'Usuario do Sistema', N'Usuario', N'USUARIO');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Descricao', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[Funcoes]'))
    SET IDENTITY_INSERT [Funcoes] OFF;

GO

CREATE INDEX [IX_Categorias_IdTipoMovimentacao] ON [Categorias] ([IdTipoMovimentacao]);

GO

ALTER TABLE [Categorias] ADD CONSTRAINT [FK_Categorias_TiposMovimentacao_IdTipoMovimentacao] FOREIGN KEY ([IdTipoMovimentacao]) REFERENCES [TiposMovimentacao] ([IdTipoMovimentacao]) ON DELETE CASCADE;

GO

ALTER TABLE [Metas] ADD CONSTRAINT [FK_Metas_TiposMovimentacao_IdTipoMovimentacao] FOREIGN KEY ([IdTipoMovimentacao]) REFERENCES [TiposMovimentacao] ([IdTipoMovimentacao]) ON DELETE CASCADE;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220525155201_alteracoesbasegeral', N'3.1.24');

GO

