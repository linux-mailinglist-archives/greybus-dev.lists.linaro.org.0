Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D430A0EF
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:53:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 16E536679A
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:53:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 00ECB6679B; Mon,  1 Feb 2021 04:53:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D5050667A4;
	Mon,  1 Feb 2021 04:52:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 919E36600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 82D8266460; Sun, 31 Jan 2021 17:31:17 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by lists.linaro.org (Postfix) with ESMTPS id BFBC36600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:15 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d13so8676199plg.0
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TEuL+hVALlT8knIGIfWrKAZ33sVizOsXkuWP5jla1Js=;
 b=FCTtAORbdmppacdYUEK4fPwR0YWZ9ayCOjxn21Co8AqrVdQv5EWArE4SH2HYYN+8mN
 rBAeQQfjd5NL5OPuvC0zb0OwWzcR5hOBNLQdD0ZhuFrKVWMb3nvv68sbIuCCizsPUlGp
 7ueRuqsSbY7d3ljWFzLAttpFx27HhVAo6Cq625aqHUtQwWVYiEQzxRTGsgATOH74xFem
 GR/Hv5XDysaTPiHEON9Y/bsAEb3FkeVIBE1xW3YzlkP9cM7Cd4DDFMtXmUtXSVpgQ7wo
 nLzaSE1n/vboZq9oxmJ+WPurTGHrY2L4nd5LS4tiShO1R9H3q1CkmB9LfKtIPd7lFtAO
 rSYg==
X-Gm-Message-State: AOAM532JkDb04C7PerWr4GP4DO7tsLfAZlbLOl2FSPVB+2Kv/Onv9FV4
 02tFF7lkFRzm3jkRSnfuG9U=
X-Google-Smtp-Source: ABdhPJwClbOYDSZgU1qyhZKF5sKoWjPX/HRVrzUbA9w6Ly4Wkml4MfQKKspYRwVmGG102CbvmJnvxg==
X-Received: by 2002:a17:902:b116:b029:e1:58b2:2280 with SMTP id
 q22-20020a170902b116b02900e158b22280mr2028228plr.29.1612114274980; 
 Sun, 31 Jan 2021 09:31:14 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id r194sm14995355pfr.168.2021.01.31.09.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:31:14 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:23 +0530
Message-Id: <20210131172838.146706-3-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131172838.146706-1-memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:52:47 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Marc Dietrich <marvin24@gmx.de>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 ac100@lists.launchpad.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 linux-tegra@vger.kernel.org, William Cohen <wcohen@redhat.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: [greybus-dev] [PATCH 02/13] staging: greybus: Switch from strlcpy
	to strscpy
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

c3RybGNweSBpcyBtYXJrZWQgYXMgZGVwcmVjYXRlZCBpbiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mv
ZGVwcmVjYXRlZC5yc3QsCmFuZCB0aGVyZSBpcyBubyBmdW5jdGlvbmFsIGRpZmZlcmVuY2Ugd2hl
biB0aGUgY2FsbGVyIGV4cGVjdHMgdHJ1bmNhdGlvbgood2hlbiBub3QgY2hlY2tpbmcgdGhlIHJl
dHVybiB2YWx1ZSkuIHN0cnNjcHkgaXMgcmVsYXRpdmVseSBiZXR0ZXIgYXMgaXQKYWxzbyBhdm9p
ZHMgc2Nhbm5pbmcgdGhlIHdob2xlIHNvdXJjZSBzdHJpbmcuCgpUaGlzIHNpbGVuY2VzIHRoZSBy
ZWxhdGVkIGNoZWNrcGF0Y2ggd2FybmluZ3MgZnJvbToKNWRiZGIyZDg3YzI5ICgiY2hlY2twYXRj
aDogcHJlZmVyIHN0cnNjcHkgdG8gc3RybGNweSIpCgpTaWduZWQtb2ZmLWJ5OiBLdW1hciBLYXJ0
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19oZWxwZXIuYyAgIHwgMiArLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9fbW9kdWxlLmMgICB8IDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9s
b2d5LmMgfCA2ICsrKy0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcG93ZXJfc3VwcGx5LmMg
ICB8IDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jICAgICAgICAgfCA0ICsr
LS0KIDUgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMKaW5kZXggMzAxMWI4YWJjLi4xZWQ0Nzcy
ZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCisr
KyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCkBAIC0xNjYsNyArMTY2
LDcgQEAgc3RhdGljIGludCBnYmF1ZGlvX3JlbW92ZV9jb250cm9scyhzdHJ1Y3Qgc25kX2NhcmQg
KmNhcmQsIHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCXNucHJpbnRmKGlkLm5hbWUsIHNpemVvZihp
ZC5uYW1lKSwgIiVzICVzIiwgcHJlZml4LAogCQkJCSBjb250cm9sLT5uYW1lKTsKIAkJZWxzZQot
CQkJc3RybGNweShpZC5uYW1lLCBjb250cm9sLT5uYW1lLCBzaXplb2YoaWQubmFtZSkpOworCQkJ
c3Ryc2NweShpZC5uYW1lLCBjb250cm9sLT5uYW1lLCBzaXplb2YoaWQubmFtZSkpOwogCQlpZC5u
dW1pZCA9IDA7CiAJCWlkLmlmYWNlID0gY29udHJvbC0+aWZhY2U7CiAJCWlkLmRldmljZSA9IGNv
bnRyb2wtPmRldmljZTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlv
X21vZHVsZS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbW9kdWxlLmMKaW5kZXgg
YTI0M2Q2MGYwLi4wZjlmZGMwNzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2F1ZGlvX21vZHVsZS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21vZHVs
ZS5jCkBAIC0zNDIsNyArMzQyLDcgQEAgc3RhdGljIGludCBnYl9hdWRpb19wcm9iZShzdHJ1Y3Qg
Z2JfYnVuZGxlICpidW5kbGUsCiAJLyogaW5mb3JtIGFib3ZlIGxheWVyIGZvciB1ZXZlbnQgKi8K
IAlkZXZfZGJnKGRldiwgIkluZm9ybSBzZXRfZXZlbnQ6JWQgdG8gYWJvdmUgbGF5ZXJcbiIsIDEp
OwogCS8qIHByZXBhcmUgZm9yIHRoZSBhdWRpbyBtYW5hZ2VyICovCi0Jc3RybGNweShkZXNjLm5h
bWUsIGdibW9kdWxlLT5uYW1lLCBHQl9BVURJT19NQU5BR0VSX01PRFVMRV9OQU1FX0xFTik7CisJ
c3Ryc2NweShkZXNjLm5hbWUsIGdibW9kdWxlLT5uYW1lLCBHQl9BVURJT19NQU5BR0VSX01PRFVM
RV9OQU1FX0xFTik7CiAJZGVzYy52aWQgPSAyOyAvKiB0b2RvICovCiAJZGVzYy5waWQgPSAzOyAv
KiB0b2RvICovCiAJZGVzYy5pbnRmX2lkID0gZ2Jtb2R1bGUtPmRldl9pZDsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jCmluZGV4IDY2MmUzZThiNC4uZTgxNmU0ZGI1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jCisrKyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKQEAgLTIwMCw3ICsyMDAs
NyBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfY3RsX2luZm8oc3RydWN0IHNuZF9rY29udHJv
bCAqa2NvbnRyb2wsCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJbmFtZSA9IGdiYXVkaW9fbWFwX2Nv
bnRyb2xpZChtb2R1bGUsIGRhdGEtPmN0bF9pZCwKIAkJCQkJICAgICB1aW5mby0+dmFsdWUuZW51
bWVyYXRlZC5pdGVtKTsKLQkJc3RybGNweSh1aW5mby0+dmFsdWUuZW51bWVyYXRlZC5uYW1lLCBu
YW1lLCBOQU1FX1NJWkUpOworCQlzdHJzY3B5KHVpbmZvLT52YWx1ZS5lbnVtZXJhdGVkLm5hbWUs
IG5hbWUsIE5BTUVfU0laRSk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWRldl9lcnIoY29tcC0+
ZGV2LCAiSW52YWxpZCB0eXBlOiAlZCBmb3IgJXM6a2NvbnRyb2xcbiIsCkBAIC0xMDQ3LDcgKzEw
NDcsNyBAQCBzdGF0aWMgaW50IGdiYXVkaW9fdHBsZ19jcmVhdGVfd2lkZ2V0KHN0cnVjdCBnYmF1
ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAJfQogCiAJLyogUHJlZml4IGRldl9pZCB0byB3aWRn
ZXQgY29udHJvbF9uYW1lICovCi0Jc3RybGNweSh0ZW1wX25hbWUsIHctPm5hbWUsIE5BTUVfU0la
RSk7CisJc3Ryc2NweSh0ZW1wX25hbWUsIHctPm5hbWUsIE5BTUVfU0laRSk7CiAJc25wcmludGYo
dy0+bmFtZSwgTkFNRV9TSVpFLCAiR0IgJWQgJXMiLCBtb2R1bGUtPmRldl9pZCwgdGVtcF9uYW1l
KTsKIAogCXN3aXRjaCAody0+dHlwZSkgewpAQCAtMTE2OSw3ICsxMTY5LDcgQEAgc3RhdGljIGlu
dCBnYmF1ZGlvX3RwbGdfcHJvY2Vzc19rY29udHJvbHMoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2lu
Zm8gKm1vZHVsZSwKIAkJfQogCQljb250cm9sLT5pZCA9IGN1cnItPmlkOwogCQkvKiBQcmVmaXgg
ZGV2X2lkIHRvIHdpZGdldF9uYW1lICovCi0JCXN0cmxjcHkodGVtcF9uYW1lLCBjdXJyLT5uYW1l
LCBOQU1FX1NJWkUpOworCQlzdHJzY3B5KHRlbXBfbmFtZSwgY3Vyci0+bmFtZSwgTkFNRV9TSVpF
KTsKIAkJc25wcmludGYoY3Vyci0+bmFtZSwgTkFNRV9TSVpFLCAiR0IgJWQgJXMiLCBtb2R1bGUt
PmRldl9pZCwKIAkJCSB0ZW1wX25hbWUpOwogCQljb250cm9sLT5uYW1lID0gY3Vyci0+bmFtZTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Bvd2VyX3N1cHBseS5jIGIvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvcG93ZXJfc3VwcGx5LmMKaW5kZXggZWM5NmYyODg4Li43NWNi
MTcwZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Bvd2VyX3N1cHBseS5j
CisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Bvd2VyX3N1cHBseS5jCkBAIC00NDksNyAr
NDQ5LDcgQEAgc3RhdGljIGludCBfX2diX3Bvd2VyX3N1cHBseV9zZXRfbmFtZShjaGFyICppbml0
X25hbWUsIGNoYXIgKm5hbWUsIHNpemVfdCBsZW4pCiAKIAlpZiAoIXN0cmxlbihpbml0X25hbWUp
KQogCQlpbml0X25hbWUgPSAiZ2JfcG93ZXJfc3VwcGx5IjsKLQlzdHJsY3B5KG5hbWUsIGluaXRf
bmFtZSwgbGVuKTsKKwlzdHJzY3B5KG5hbWUsIGluaXRfbmFtZSwgbGVuKTsKIAogCXdoaWxlICgo
cmV0IDwgbGVuKSAmJiAocHN5ID0gcG93ZXJfc3VwcGx5X2dldF9ieV9uYW1lKG5hbWUpKSkgewog
CQlwb3dlcl9zdXBwbHlfcHV0KHBzeSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9zcGlsaWIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jCmluZGV4IGZj
MjdjNTJkZS4uNjcyZDU0MGQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9z
cGlsaWIuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zcGlsaWIuYwpAQCAtNDU1LDEw
ICs0NTUsMTAgQEAgc3RhdGljIGludCBnYl9zcGlfc2V0dXBfZGV2aWNlKHN0cnVjdCBnYl9zcGls
aWIgKnNwaSwgdTggY3MpCiAJZGV2X3R5cGUgPSByZXNwb25zZS5kZXZpY2VfdHlwZTsKIAogCWlm
IChkZXZfdHlwZSA9PSBHQl9TUElfU1BJX0RFVikKLQkJc3RybGNweShzcGlfYm9hcmQubW9kYWxp
YXMsICJzcGlkZXYiLAorCQlzdHJzY3B5KHNwaV9ib2FyZC5tb2RhbGlhcywgInNwaWRldiIsCiAJ
CQlzaXplb2Yoc3BpX2JvYXJkLm1vZGFsaWFzKSk7CiAJZWxzZSBpZiAoZGV2X3R5cGUgPT0gR0Jf
U1BJX1NQSV9OT1IpCi0JCXN0cmxjcHkoc3BpX2JvYXJkLm1vZGFsaWFzLCAic3BpLW5vciIsCisJ
CXN0cnNjcHkoc3BpX2JvYXJkLm1vZGFsaWFzLCAic3BpLW5vciIsCiAJCQlzaXplb2Yoc3BpX2Jv
YXJkLm1vZGFsaWFzKSk7CiAJZWxzZSBpZiAoZGV2X3R5cGUgPT0gR0JfU1BJX1NQSV9NT0RBTElB
UykKIAkJbWVtY3B5KHNwaV9ib2FyZC5tb2RhbGlhcywgcmVzcG9uc2UubmFtZSwKLS0gCjIuMjku
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9s
aXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
