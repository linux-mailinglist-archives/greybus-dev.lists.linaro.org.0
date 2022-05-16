Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6E528501
	for <lists+greybus-dev@lfdr.de>; Mon, 16 May 2022 15:10:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 094C14106F
	for <lists+greybus-dev@lfdr.de>; Mon, 16 May 2022 13:10:29 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	by lists.linaro.org (Postfix) with ESMTPS id 2EFC9405C7
	for <greybus-dev@lists.linaro.org>; Mon, 16 May 2022 13:10:26 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id v66so18527694oib.3
        for <greybus-dev@lists.linaro.org>; Mon, 16 May 2022 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CaF92eBKzl8YhqaTS1Tzg7cnBN+wgBVFhVH+tqOT7PI=;
        b=q0OW4Ll0d1esJg4Bsi1gSdlTXNns+dyRXpjhWwy3TYP4n4qr8/NV4nZJZKjjduBKRi
         cA/1ac5Z/Sme7x9B3srXyZPtmX5SKG2ovm3cO9mWg1RmnkOoPJ3oT1jhhOpvYVxSxOtK
         EETC7rAwge3lFdAza0DWk9nk5BgdUO+u4Mgw7bEh4ZYJNK3Aeh9oPPg2Ig7eRjDoosqU
         UzYV1++XIwCfe0WO0MlnNE9IF9nupMaem9yK2ia5n1v/9WBmbIxEnxV0yjVXGEaFXtPd
         F/Q36d9JPkZFcTSysTH5PQ0es9AeN0p4TfoGPkBlB9oAT02H+Hc1mjA9INBnW3qT0TLE
         TCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=CaF92eBKzl8YhqaTS1Tzg7cnBN+wgBVFhVH+tqOT7PI=;
        b=JhIw6QrFJoecG9mR11Pv8l7HVngvGHaHjvzU0v3tTn4vbymM250OOGOOnsY+AZW+S3
         gXsmhXL1VG7WF9hGwTWbnEbDb46dPeLc8O2G2qGTbxd2xHE2fOyWrJDojBZrQPu7lhkZ
         5E4AVNUg8H3omac6qlNuZ1pUOy7ZXU08ONAsm2GFl308GGU2X2vqqZqrxDtsx6f5SDXs
         F3snKkMRn33wSIFZjg147LdBaaB+t51b4FqdyYS7VzH5sRJmRq78GBEgmNtHucXGgIiI
         voQKQDdSIFRoCtQ4iQ+vaTffvZ1L27emZWNl/MNsBX+qd1chx4PY24uUTVBhOTJ3qZzc
         +63A==
X-Gm-Message-State: AOAM530e6UhCwBYOYyRFn67pNF/jb3jyKzLiEHkluywXJsGxLKq3oFI+
	9btZspbe34nzlJwj/J0MCgY=
X-Google-Smtp-Source: ABdhPJzuSlHddEfPdlSooNCiKn9gKqW9iethwrrpTKVRacgUq5xfLq0fJvrzlLVkrWbJmB72AUE4Hw==
X-Received: by 2002:a05:6808:148a:b0:326:c71a:f33c with SMTP id e10-20020a056808148a00b00326c71af33cmr12758233oiw.153.1652706625572;
        Mon, 16 May 2022 06:10:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r3-20020acac103000000b00325cda1ff95sm3795450oif.20.2022.05.16.06.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 06:10:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 May 2022 06:10:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20220516131023.GA2329080@roeck-us.net>
References: <20220228103142.3301082-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
Message-ID-Hash: ZEM4NBRJXKXARXR72B3JJBMRRFCL74G6
X-Message-ID-Hash: ZEM4NBRJXKXARXR72B3JJBMRRFCL74G6
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZEM4NBRJXKXARXR72B3JJBMRRFCL74G6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMTE6Mjc6NDNBTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToNCj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IER1cmlu
ZyBhIHBhdGNoIGRpc2N1c3Npb24sIExpbnVzIGJyb3VnaHQgdXAgdGhlIG9wdGlvbiBvZiBjaGFu
Z2luZw0KPiB0aGUgQyBzdGFuZGFyZCB2ZXJzaW9uIGZyb20gZ251ODkgdG8gZ251OTksIHdoaWNo
IGFsbG93cyB1c2luZyB2YXJpYWJsZQ0KPiBkZWNsYXJhdGlvbiBpbnNpZGUgb2YgYSBmb3IoKSBs
b29wLiBXaGlsZSB0aGUgQzk5LCBDMTEgYW5kIGxhdGVyIHN0YW5kYXJkcw0KPiBpbnRyb2R1Y2Ug
bWFueSBvdGhlciBmZWF0dXJlcywgbW9zdCBvZiB0aGVzZSBhcmUgYWxyZWFkeSBhdmFpbGFibGUg
aW4NCj4gZ251ODkgYXMgR05VIGV4dGVuc2lvbnMgYXMgd2VsbC4NCg0KVGhlIGRvd25zaWRlIGlz
IHRoYXQgYmFja3BvcnRpbmcgYWZmZWN0ZWQgcGF0Y2hlcyB0byBvbGRlciBrZXJuZWwgYnJhbmNo
ZXMNCm5vdyBmYWlscyB3aXRoIGVycm9yIG1lc3NhZ2VzIHN1Y2ggYXMNCg0KbW0va2ZlbmNlL2Nv
cmUuYzogSW4gZnVuY3Rpb24g4oCYa2ZlbmNlX2luaXRfcG9vbOKAmToNCm1tL2tmZW5jZS9jb3Jl
LmM6NTk1OjI6IGVycm9yOiDigJhmb3LigJkgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBhcmUg
b25seSBhbGxvd2VkIGluIEM5OSBvciBDMTEgbW9kZQ0KDQpKdXN0IHNvbWV0aGluZyB0byBrZWVw
IGluIG1pbmQgd2hlbiB3cml0aW5nIHBhdGNoZXMuDQoNCkd1ZW50ZXINCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
