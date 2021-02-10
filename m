Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7F3318456
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 05:27:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1267960C36
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 04:27:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 07298666DC; Thu, 11 Feb 2021 04:27:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2FA5066756;
	Thu, 11 Feb 2021 04:27:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4CC3F66034
 for <greybus-dev@lists.linaro.org>; Wed, 10 Feb 2021 22:14:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3860B66529; Wed, 10 Feb 2021 22:14:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by lists.linaro.org (Postfix) with ESMTPS id 586EC66034
 for <greybus-dev@lists.linaro.org>; Wed, 10 Feb 2021 22:14:48 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id p20so6920962ejb.6
 for <greybus-dev@lists.linaro.org>; Wed, 10 Feb 2021 14:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TLQHZYiHAcfMtJij9bBMXiJV8bp7vLmKRqNCBw8+ijc=;
 b=piEq7oLoxjFIzPsp7V+ben8l3df8lYeOR45joFf6oS1UYBgGbW9/DcIKVY0+n+8pbo
 q+145pDpANHowgjcv3iqT7SHlmtInRZz4jZPnS+ySvIz8nLQMvOX8mPX/iNLmcBIFIjr
 m4ZfqKmF4+Ev9yisK1bAIeh1YHb9419HsmozqPVR9c6loOEDmc8rl3Nn0++N27co48Wz
 TankACVOT1zW7T1PfL81slOVQgSa186+4do++kHInzH1SUytnPuczsJhHMrFmjTdkWt8
 7TdLe13UhJjC9Q6cKVC5pBM+S1fZPQmVQD/asbDj5Xs+KtGTJO3XMsA2dk4SYhXBdv6F
 oc5g==
X-Gm-Message-State: AOAM531WypvokMzsMFmTsM5I+klvVPTH2p1NTmW4Yy+chdHdLP7zq823
 lSUKDBAa4yVvpXrH7ml2euY=
X-Google-Smtp-Source: ABdhPJz2EFGkeo94PcaY8UQDCUVYJyF/C0qFCnJHLmZHnw28VJfmsI5BiIngRgNAzmaLQti6EEKcaA==
X-Received: by 2002:a17:906:390c:: with SMTP id
 f12mr5187225eje.31.1612995287367; 
 Wed, 10 Feb 2021 14:14:47 -0800 (PST)
Received: from TRWS9215.usr.ingenico.loc ([78.190.146.52])
 by smtp.gmail.com with ESMTPSA id b3sm2130578edw.14.2021.02.10.14.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:14:46 -0800 (PST)
From: Fatih YILDIRIM <yildirim.fatih@gmail.com>
To: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Date: Thu, 11 Feb 2021 01:14:38 +0300
Message-Id: <20210210221439.3489-1-yildirim.fatih@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 11 Feb 2021 04:27:39 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, yildirim.fatih@gmail.com
Subject: [greybus-dev] [PATCH 0/1] Coding style fix
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

SGksCkkgaGF2ZSBhIGNvZGluZyBzdHlsZSBmaXggaW4gZ3JleWJ1cyBzdWJzeXN0ZW0uCgpCeSB0
aGUgd2F5LCBJJ20gZm9sbG93aW5nIHRoZSBFdWR5cHR1bGEgQ2hhbGxlbmdlIExpbnV4IGtlcm5l
bCB0YXNrcyBhbmQKdGhpcyBwYXRjaCBpcyByZWxhdGVkIHRvIG15IHRhc2sgbm8gMTAuIEkgaG9w
ZSBJJ20gZG9pbmcgaXQgdGhlIHJpZ2h0IHdheS4KVGhhbmtzIGZvciB5b3VyIHVuZGVyc3RhbmRp
bmcgYW5kIGtpbmQgY29tbWVudHMuCgpGYXRpaCBZSUxESVJJTSAoMSk6CiAgTWFjcm9zIHdpdGgg
bXVsdGlwbGUgc3RhdGVtZW50cyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gYSBkbyAtIHdoaWxlCiAg
ICBsb29wLgoKIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMgfCAxMCArKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
