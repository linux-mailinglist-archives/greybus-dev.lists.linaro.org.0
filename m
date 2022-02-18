Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B14CA93C
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:38:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9230C3EF06
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:38:08 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	by lists.linaro.org (Postfix) with ESMTPS id 468113EEA5
	for <greybus-dev@lists.linaro.org>; Fri, 18 Feb 2022 04:52:41 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id m3so7401832eda.10
        for <greybus-dev@lists.linaro.org>; Thu, 17 Feb 2022 20:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Oq0pHI88XRcgmRgUmJQw3hpIZLFUj9jjieH+c9ZOuP0=;
        b=RzCo/jKO4PKJ1Xk8wAmQuvTbeXLkca1zPO6952Z2oOxjLha+Vm8zCp38s1hRCiq5uX
         OyeP7XEoQ3yiNpXR2Y6m5VCWzzZhGh7eK/uaKX7/uTgATffvAXjsEQnAOxR2q0pq8wmH
         xPVFaHAA2gM3IANGWSHLPxZz7t/C0o7aTC1gVOMrDwKpsGQ1Y/ulI4QOpfFb9xc4ALB6
         Vv5vpgQxmxZnj78+drvX2+X0VR6Yf59zJUAQ+SI/+2NEiZ1tWTS0EoCXaUe7nhqG4oO1
         XVnkApELTIkiV6YNg42P3X+n20i37YTBjfsgabu7HpiRSoX4TmOE0ckn9daVlTjYGbTA
         pgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Oq0pHI88XRcgmRgUmJQw3hpIZLFUj9jjieH+c9ZOuP0=;
        b=JKAJqCVmxcKF43s4XtF3G1YsqFCPFWRDLkSDpMnds53h8RGnj7NhoOkrwUF0WNxvpW
         hBmrrCnCGWOS4RwfD0/ODvGHcGJj5nXeDGlF7idylFWqxbZWgDEodCekDahzPHcxxtRp
         h7NVaS8ojpNXq9mal23h38KBfbBZ99S6AkKuUnlDXVH1Lwyc0rmfaly3DDNeZbojF+1f
         Iq4b5Gq2eqL3p6x8ZSBIGOfCM5/vhoX83Y5/7pRieCiCmhi1WYq5bPjH1N+6y6cVyzef
         DNIybIpbtezDCAK2xTHRLXCd1JKYkP40vaY7FqvI6hQhsVkaWtQ4xmsxfFdDHlXmlfHL
         c3ow==
X-Gm-Message-State: AOAM533NYa2nnRGzJ8iNt+yyv+64Lm4uha2j7/gMUsa1TBy4NV8mo10s
	u/45NrzzrsvlvvHlTp398Rjx68PpiXMKRQDay3A=
X-Google-Smtp-Source: ABdhPJxxyobdGRxK8+05/itVXLz+PQK+3ZCQRM16d0rQt8CTvvdfF2KGK3dPDZJHlWi6RGCoUS5i4pwRQ/xShj/pqUc=
X-Received: by 2002:a05:6402:34d4:b0:412:b228:868b with SMTP id
 w20-20020a05640234d400b00412b228868bmr4372649edc.444.1645159960189; Thu, 17
 Feb 2022 20:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20220217190722.44894-1-ahamedhusni73@gmail.com> <Yg6hcX6XK4Eu0KOR@kroah.com>
In-Reply-To: <Yg6hcX6XK4Eu0KOR@kroah.com>
From: Ahamed Husni <ahamedhusni73@gmail.com>
Date: Fri, 18 Feb 2022 10:22:28 +0530
Message-ID: <CAFjpAKqy908scQTRJPkMhEz8OyNiR3-N8XD2hiGa+VBLhUf0VA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-MailFrom: ahamedhusni73@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EHYTA5XLOCPHVGIHOFQ3ILL67EIFY5DW
X-Message-ID-Hash: EHYTA5XLOCPHVGIHOFQ3ILL67EIFY5DW
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:38:06 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: Fix Coding Style Error
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EHYTA5XLOCPHVGIHOFQ3ILL67EIFY5DW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgR3JlZywNCg0KT24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgMTI6NTYgQU0gR3JlZyBLSCA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiBEaWQgeW91IHRyeSB0byBidWlsZCB0
aGlzIGNoYW5nZT8NCg0KSSBhbSBhIG5ld2JpZSBrZXJuZWwgZGV2IGFuZCB0cnlpbmcgdG8gdW5k
ZXJzdGFuZCBob3cgdGhpbmdzIHdvcmsuDQpJIGRpZCBub3QgYnVpbGQgdGhpcyBjaGFuZ2UgYnkg
dGhlIHRpbWUgSSBzZW50IHlvdSB0aGlzLCB0aGlua2luZyB0aGlzDQppcyBqdXN0IGEgc3R5bGUg
Y2hhbmdlLg0KSSBzaG91bGQgaGF2ZSB0ZXN0ZWQgdGhlIGJ1aWxkLiBJIGFtIHNvcnJ5Lg0KDQpO
b3cgSSBidWlsdCB0aGUgY2hhbmdlcyBieSBzZXR0aW5nIHRoZSBmb2xsb3dpbmcgY29uZmlndXJh
dGlvbnMuDQpDT05GSUdfR1JFWUJVUw0KQ09ORklHX1NUQUdJTkcNCkNPTkZJR19HUkVZQlVTX0xP
T1BCQUNLDQoNCk15IGNoYW5nZSBpbnRyb2R1Y2VzIHRoZSBmb2xsb3dpbmcgZXJyb3IuDQonJycn
DQpkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jOjE2NjoyOiBlcnJvcjogZXhwZWN0
ZWQgaWRlbnRpZmllcg0Kb3Ig4oCYKOKAmSBiZWZvcmUg4oCYZG/igJkNCiAgMTY2IHwgIGRvIHsg
ICAgICAgICAgICBcDQogICAgICB8ICBefg0KJycnJw0KSSBjb3VsZCBub3QgZml4IG9yIGZpbmQg
dGhlIHJlYXNvbiBmb3IgdGhpcyBlcnJvci4gUGxlYXNlIGd1aWRlIG1lIGluDQp0aGlzIHJlZ2Fy
ZC4NCg0KVGhhbmtzLA0KSHVzbmkuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2
LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
