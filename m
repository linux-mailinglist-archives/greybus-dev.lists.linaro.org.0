Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A948F13B
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Aug 2019 18:50:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4579860961
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Aug 2019 16:50:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3888960BD7; Thu, 15 Aug 2019 16:50:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6498660E91;
	Thu, 15 Aug 2019 16:50:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 11C6160961
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 16:50:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 04E8E60BFB; Thu, 15 Aug 2019 16:50:08 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by lists.linaro.org (Postfix) with ESMTPS id 839FA60961
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 16:50:03 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id j6so447667ioa.5
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 09:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=v0UJ9WPaxaZa7EP8QipRb+TmrU6Uu1bBnPQKzUtNUyw=;
 b=fcyAjfeYF27Wg9ohxuD3YiBAB0QoLdNEkl7Z6CFK5BnGVsJ/3Cj+PmmQ07/llQyQSv
 p/SZch/TC8ebWOewHLITDUwa/eg/8+4L8sko1kYZbMwLoDRD2sUoA+51TI2jU4ik8LGJ
 bgZPM5PiW+gBeH8Wq5Y4kxyqoZj9J1koC8BDtE/V23Rx5Hcp98eKANiPKiXWsYO4rYVS
 nyb5xx6NifNS0r+fCvO7GQGh3tG284cFz7Qe8yvl2QevYq+W3SEEVCMRQ/9vRY46+yCD
 tcFopyrm7NdFoEQ55yVR4iSU22eFMKh8ViGqo+RFktQVUq7o6XMZmdaCV5DbX5jpenju
 yudw==
X-Gm-Message-State: APjAAAWCYG2AnYZGnDKjaugVmT+Smecye/8OEOiA4duzk6VeIZi6oI8a
 /jfSlLqsFkr4rtFY/dK4R+EAhfE/4MwDlUtIpzPGX88mx6E=
X-Google-Smtp-Source: APXvYqwqWmjSVpMGqugWL3yx0sgZK6h0joS5JyfRzaKvusctA9vjaVXrZHH4lM/+1ViJdulF0exH1+lmAQ9F9aH2Zd4=
X-Received: by 2002:a5d:994b:: with SMTP id v11mr5953688ios.165.1565887802560; 
 Thu, 15 Aug 2019 09:50:02 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Thu, 15 Aug 2019 12:49:51 -0400
Message-ID: <CAF4BF-R5yjta8zTcsFc8auYQ8cAHDqN0yM5rYwG6JctCbkOm1g@mail.gmail.com>
To: greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] binding gb gpio device to gb-phy driver?
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

SGkgTGlzdCEKCkknbSBjdXJyZW50bHkgdXNpbmcgZ2JyaWRnZSAvIHRjcGlwIHdpdGggdGhlCklJ
RDEtc2ltcGxlLWdwaW8tbW9kdWxlLm1uZnMgZXhhbXBsZSB0byBob29rIHVwIGEgZmFrZSBtb2R1
bGUgdGhhdApqdXN0IHJlc3BvbmRzIHRvIHNvY2tldCBJL08uCgpBIGNvdXBsZSBvZiBzbWFsbCBj
aGFuZ2VzIHdlcmUgcmVxdWlyZWQsIGJ1dCBldmVyeXRoaW5nIHNlZW1zIHRvIGJlCnBhcnNlZCwg
YnVuZGxlcywgY3BvcnRzIGFyZSBhbGwgY3JlYXRlZC4KCkhvd2V2ZXIsIGZvciBzb21lIHJlYXNv
biwgZ3JleWJ1cyBkb2VzIG5vdCBzZWVtIHRvIGF1dG9tYXRpY2FsbHkgYmluZAp0aGUgZGV2aWNl
IHRvIHRoZSBnYi1ncGlvIGRyaXZlciwgbm9yIGRvZXMgaXQgcHJvYmUgdGhlIGRldmljZS4gSSBv
bmx5CnNlZSBwaW5ncyBhZnRlciB0aGUgc3ZjIGhhcyBpbnNlcnRlZCBteSBmYWtlIG1vZHVsZSBh
bmQgaGFuZHNoYWtlIGlzCmNvbXBsZXRlLgoKSXMgYW55b25lIGF3YXJlIGlmIGEgc2VwYXJhdGUg
c3RlcCB0aGF0IGlzIHJlcXVpcmVkIHRvIGJpbmQgdGhlIGRldmljZQp0byB0aGUgZHJpdmVyPwpJ
J3ZlIHRyaWVkCgpzdWRvIHNoIC1jICdlY2hvIC1uIDEtMi4yLjEgPiAvc3lzL2J1cy9nYnBoeS9k
cml2ZXJzL2dwaW8vYmluZCcKCmJ1dCB0aGF0IGdpdmVzIG1lIC1FTk9ERVYKCkFueSBwb2ludGVy
cyB3b3VsZCBiZSBncmVhdCEKClRoYW5rcywKCkMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGlu
Zm8vZ3JleWJ1cy1kZXYK
