# Brasil Utils

Small, focused **Swift** utilities for Brazilian data.

> Português: [README.pt-BR.md](README.pt-BR.md)

## Features

| Utility | What it does |
|---------|----------------|
| `Phone` | Format (79) 99999-9999 and extract digits |
| `CEP` | Format and validate CEP |
| `CPF` | Validate and format CPF |
| `Currency` | Format as R$ (pt-BR) |

## Install

```swift
.package(url: "https://github.com/RknDEV1/brasil-utils.git", branch: "main")
```

## Usage

```swift
Phone.format("79999999999")        // (79) 99999-9999
CEP.format("49000000")             // 49000-000
CPF.isValid("390.533.447-05")      // true
Currency.format(19.90)             // R$ 19,90
```

## License

MIT
