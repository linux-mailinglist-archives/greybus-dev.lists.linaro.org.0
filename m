Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8976A3187CF
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 11:10:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4D5F66034
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 10:10:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 97B4666760; Thu, 11 Feb 2021 10:10:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5078C666DC;
	Thu, 11 Feb 2021 10:10:47 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8279D60FF9
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 10:10:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6FAB3665EF; Thu, 11 Feb 2021 10:10:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by lists.linaro.org (Postfix) with ESMTPS id 5C8F660FF9
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 10:10:43 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d13so3079263plg.0
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 02:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0UWUI/kkDinmay7MvgnYpZn7ou/nW9tAWna4jMvJtvY=;
 b=CF015ek7S/huDI4/ufL5wk6JoGyVo+oXO8QvG5d5fE8cQObGVWI/cgPccm7wG+igNG
 TZgwFDuZHC4EoEyOV9jdenDy6a4ENKodVpzdX7zpy1P2FvmyninNo7I7ZFu3nbjrh3xu
 Omrb08UYiXsQ2dKRnuCytBYl4ar5R66D2ibJpgLoP0w2mf7bdTCtBSODjRKmIhHopRaj
 rn4xfGohNoT8yWsTyEF5FnRTi2XUp5Xd6+AZnblHRZ5bN9E+15WR1VeYzIp/h4wwcdYh
 9B8edDXJ7JO2/1aS20VjPGrlJ25laMRb6PRqONWNfHNKP+Jsb0vhPtf5cxYl4+PJmsyO
 uDkg==
X-Gm-Message-State: AOAM532YjiYU2cLsoNBCuJkimjGVsvQM9SMgMMgPraSmO6Jyjcm/icbF
 CWXqLOv2qGPvvituVJCQk9JXSnsA
X-Google-Smtp-Source: ABdhPJyI4I2N7+f2yBokicCsqPV12GPsfMpH8tS1rxFrBawOPBvQFC5Pa0IK/8oSkGKZYpcmRkkM8w==
X-Received: by 2002:a17:902:c408:b029:e2:ba09:d442 with SMTP id
 k8-20020a170902c408b02900e2ba09d442mr6875531plk.83.1613038242539; 
 Thu, 11 Feb 2021 02:10:42 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id mv14sm7847662pjb.0.2021.02.11.02.10.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:10:41 -0800 (PST)
Date: Thu, 11 Feb 2021 15:40:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20210211101039.m5q26qgxififotqp@vireshk-i7>
References: <20210211095444.54447-1-hemanshagnihotri27@gmail.com>
 <YCUAMgFa6i9vl9An@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCUAMgFa6i9vl9An@kroah.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, linux-kernel@vger.kernel.org,
 johan@kernel.org, greybus-dev@lists.linaro.org,
 Hemansh Agnihotri <hemanshagnihotri27@gmail.com>
Subject: Re: [greybus-dev] [PATCH 1/1] staging: greybus: Added do - while in
 multi statement macro
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

T24gMTEtMDItMjEsIDExOjAwLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFRodSwgRmViIDExLCAyMDIx
IGF0IDAzOjI0OjQ0UE0gKzA1MzAsIEhlbWFuc2ggQWduaWhvdHJpIHdyb3RlOgo+ID4gVGhpcyBw
YXRjaCBhZGQgZml4ZXMgYW4gY2hlY2twYXRjaCBlcnJvciBmb3IgIk1hY3JvcyB3aXRoIG11bHRp
cGxlIHN0YXRlbWVudHMKPiA+IHNob3VsZCBiZSBlbmNsb3NlZCBpbiBhIGRvIC0gd2hpbGUgbG9v
cCIKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSGVtYW5zaCBBZ25paG90cmkgPGhlbWFuc2hhZ25p
aG90cmkyN0BnbWFpbC5jb20+Cj4gCj4gQW55IHJlYXNvbiB5b3UgZGlkbid0IHRlc3QtYnVpbGQg
eW91ciBwYXRjaCBiZWZvcmUgc2VuZGluZyBpdCBvdXQ/Cj4gCj4gVGhhdCdzIGEgYml0IHJ1ZGUg
dG8gcmV2aWV3ZXJzIDooCgpJIGFsc28gd29uZGVyIGhvdyB0d28gcGVvcGxlIHN0dW1ibGVkIHVw
b24gdGhlIGV4YWN0IHNhbWUgdGhpbmcgYXQgdGhlCnNhbWUgdGltZS4gQ29weS9wYXN0ZSA/Cgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjEwMjEwMjIxNDM5LjM0ODktMi15aWxkaXJp
bS5mYXRpaEBnbWFpbC5jb20vCgpBbmQgb2YgY291cnNlIE5BSyBmb3IgdGhlIHBhdGNoLiBUaGUg
bWFjcm8gaXMgdXNlZCBvdXRzaWRlIG9mIGFueQpvdGhlciByb3V0aW5lLCBhbmQgaXMgYWN0dWFs
bHkgdXNlZCB0byBjcmVhdGUgcm91dGluZXMuIE5vIGRvLXdoaWxlCnJlcXVpcmVkIGhlcmUuCgot
LSAKdmlyZXNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0
dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
