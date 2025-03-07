# AppLocker Guidance

Microsoft AppLocker is an application control feature built into Windows. Application control is one of [Information Assurance top 10 mitigation strategies](https://media.defense.gov/2019/Jul/16/2002158046/-1/-1/0/DDD-190716-666-071.PDF).

This project contains scripts and configuration files for aiding administrators in implementing Microsoft AppLocker as outlined in the [Application Control using Microsoft AppLocker]() paper. 

**The starter policy provided in this repository is for Windows 11**. 

## Guidance
NSA Information Assurance has a security guide for AppLocker called [Application Control Using Microsoft AppLocker](). For more detailed instructions and additional information, please see the [wiki](https://github.com/nsacyber/AppLocker-Guidance/wiki).  

## Addressing Living Off the Land Binaries and Scripts (LOLBAS)
For the past several years, Living Off the Land techniques have been seeing an increase in usage by threat actors. These techniques often utilize binaries, scripts, and libraries that come pre installed on Windows or see high usage on most Windows systems, which allow threat actors to operate very stealthily in those environments. LOLBAS threats can be partially mitigated using Applocker or other application control solutions. To that end, The security community has created and maintains a repository of well known LOLBAS, called the LOLBAS Project, to help defenders and admins be aware and to develop application control policies addressing LOLBAS. Microsoft has additionally put out a list of binaries that they recommend be blocked due to frequent abuse. The default policies within this repository have been updated with explicit deny rules for the respective LOLBAS and MS recommendations, but administrators should still evaluate their own networks for usage of LOLBAS and adjust the AppLocker policies accordingly.

## Resources

* [AppLocker Technical Reference](https://learn.microsoft.com/en-us/windows/device-security/applocker/applocker-technical-reference)
* [Requirements to use AppLocker](https://learn.microsoft.com/en-us/windows/device-security/applocker/requirements-to-use-applocker)
* [AppLocker Policies Deployment Guide](https://learn.microsoft.com/en-us/windows/device-security/applocker/applocker-policies-deployment-guide)
* [Microsoft Recommended Block Rules for WDAC](https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/microsoft-recommended-block-rules)
* [Living Off the Land Binaries, Scripts, and Libraries](https://lolbas-project.github.io/)

## License
See [LICENSE](LICENSE.md).

## Disclaimer
See [DISCLAIMER](DISCLAIMER.md).
