<div align="center">
  <img src="assets/images/logo.jpeg" alt="Flutter Labs Logo" width="180" />

  # Flutter Labs

  <p><strong>Laboratório de estudos em Flutter para evoluir arquitetura, UI e integrações na prática.</strong></p>

  <p>
    <img alt="Flutter" src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" />
    <img alt="Dart" src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white" />
    <img alt="Firebase Ready" src="https://img.shields.io/badge/Status-Em%20Evolu%C3%A7%C3%A3o-7B61FF" />
    <img alt="License" src="https://img.shields.io/badge/license-MIT-22C55E" />
  </p>
</div>

---

## ✨ Visão geral

Este repositório foi criado como um **playground de aprendizado** para Flutter.
A ideia é experimentar funcionalidades reais, testar abordagens de arquitetura e consolidar boas práticas de desenvolvimento mobile.

> Não é apenas um app final: é um espaço contínuo de evolução técnica.

---

## 🧰 Stack e tecnologias

<div align="left">

| Tecnologia | Uso no projeto |
|---|---|
| <img src="https://cdn.simpleicons.org/flutter/02569B" width="16" /> **Flutter** | Framework principal para UI e navegação |
| <img src="https://cdn.simpleicons.org/dart/0175C2" width="16" /> **Dart** | Linguagem base da aplicação |
| <img src="https://cdn.simpleicons.org/androidstudio/3DDC84" width="16" /> **Android Studio / VS Code** | Ambiente recomendado para desenvolvimento |
| <img src="https://cdn.simpleicons.org/git/F05032" width="16" /> **Git** | Versionamento e histórico de evolução |

</div>

---

## 🧭 Estrutura atual (resumo)

```text
lib/
├── core/                # temas, rotas, serviços e componentes compartilhados
├── features/            # organização por domínio/feature
│   ├── auth/
│   ├── dashboard/
│   ├── master_data/
│   ├── profile/
│   ├── recent/
│   └── splash/
└── l10n/                # internacionalização (pt/en)
```

Essa organização permite estudar crescimento do app por módulos, com separação entre regras de negócio, apresentação e serviços.

---

## 🚀 Como executar

### Pré-requisitos

- Flutter SDK instalado
- Dart SDK (incluso no Flutter)
- Emulador Android/iOS ou dispositivo físico

### Passo a passo

```bash
# 1) Instalar dependências
flutter pub get

# 2) Rodar o app
flutter run
```

### Build de produção (opcional)

```bash
flutter build apk --release
```

---

## 🎯 Objetivos deste laboratório

- Evoluir domínio de **Flutter e Dart** em cenários reais.
- Praticar **arquitetura por features**.
- Melhorar qualidade de UI/UX com componentes reutilizáveis.
- Consolidar boas práticas de internacionalização, serviços e navegação.

---

## 📈 Próximos passos (roadmap)

- [ ] Adicionar testes unitários por feature
- [ ] Cobrir fluxos críticos com testes de widget
- [ ] Documentar padrões de arquitetura adotados
- [ ] Criar guia de contribuição para estudos colaborativos

---

## 🤝 Contribuição

Este projeto é focado em estudo, então ideias e melhorias são bem-vindas.
Se quiser, use como base para seus próprios experimentos Flutter.

