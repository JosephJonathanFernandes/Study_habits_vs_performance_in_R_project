# 🔐 Security Policy

## Supported Versions

We release patches for security vulnerabilities for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 2.0.x   | :white_check_mark: |
| 1.0.x   | :x:                |

## Reporting a Vulnerability

The Student Study Habits Analysis project takes security seriously. If you discover a security vulnerability, please follow these steps:

### 1. Do Not Publicly Disclose

Please **do not** create a public GitHub issue for security vulnerabilities. This helps protect users who haven't yet updated.

### 2. Report Privately

Report security vulnerabilities by:

- **Email**: Create a GitHub issue marked as "Security" (if available)
- **GitHub Security Advisories**: Use the "Security" tab to privately report

### 3. Include Information

Please include the following in your report:

- **Type of vulnerability** (e.g., XSS, SQL injection, command injection)
- **Full paths** of source file(s) related to the vulnerability
- **Location** of the affected code (tag/branch/commit or direct URL)
- **Step-by-step instructions** to reproduce the issue
- **Proof-of-concept or exploit code** (if possible)
- **Impact** of the vulnerability
- **Your contact information** for follow-up

### 4. Response Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Depends on severity and complexity

## Security Considerations

### Data Privacy

- This project processes student performance data
- No data is transmitted externally
- All analysis is performed locally
- Dashboard runs on localhost by default

### Dependencies

We regularly update dependencies to patch known vulnerabilities:

- R packages from CRAN are generally vetted
- We use `install.packages()` from official CRAN mirrors
- Dependencies are listed in package installation scripts

### Safe Practices

When using this project:

1. **Keep R Updated**: Use latest stable R version
2. **Update Packages**: Regularly run `update.packages()`
3. **Review Code**: Audit scripts before running on sensitive data
4. **Network Security**: Dashboard is localhost-only by default
5. **File Permissions**: Ensure proper file permissions on data files

## Known Security Limitations

### Current Scope

This is an educational/research project with the following limitations:

- **No Authentication**: Dashboard has no user authentication
- **Local Only**: Designed for local use, not production deployment
- **Data Validation**: Minimal input validation in dashboard
- **No Encryption**: Data files are stored unencrypted

### Recommendations for Production Use

If deploying to production:

1. **Add Authentication**: Implement Shiny Server Pro or auth0
2. **Use HTTPS**: Configure SSL/TLS certificates
3. **Input Validation**: Add comprehensive input sanitization
4. **Access Control**: Implement role-based access control
5. **Audit Logging**: Track user actions and data access
6. **Data Encryption**: Encrypt sensitive data at rest
7. **Network Security**: Use firewalls and VPNs
8. **Regular Updates**: Establish update schedule for dependencies

## Security Best Practices for Contributors

When contributing code:

### Code Review

- All PRs undergo security review
- Use static analysis tools when possible
- Follow OWASP guidelines for web applications

### Avoid

- Hardcoded credentials or API keys
- Unsafe file operations (arbitrary file reads/writes)
- Command injection vulnerabilities
- SQL injection (if database is added)
- Cross-site scripting (XSS) in Shiny UI

### Use

- Parameterized queries (if databases used)
- Input validation and sanitization
- Secure file handling with path validation
- Principle of least privilege
- Environment variables for configuration

## Dependency Security

### Package Sources

- **CRAN**: Official R package repository (vetted)
- **GitHub**: Used only for development packages (review carefully)

### Monitoring

We use GitHub Dependabot alerts to monitor:

- Known vulnerabilities in dependencies
- Outdated packages with security patches
- Deprecated packages

## Incident Response

If a vulnerability is confirmed:

1. **Triage**: Assess severity and impact
2. **Patch**: Develop and test fix
3. **Notify**: Inform users via GitHub release notes
4. **Document**: Update CHANGELOG and security advisories
5. **Learn**: Post-mortem to prevent similar issues

## Security Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Shiny Security Guide](https://docs.rstudio.com/shiny-server/)
- [R Security Best Practices](https://cran.r-project.org/web/packages/policies.html)

## Acknowledgments

We thank security researchers who responsibly disclose vulnerabilities. Contributors will be acknowledged in:

- Security advisories
- CHANGELOG
- Project documentation

---

**Last Updated**: November 25, 2025

**Contact**: Open a GitHub issue or PR for security-related questions.
