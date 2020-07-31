Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC6B233E9B
	for <lists+greybus-dev@lfdr.de>; Fri, 31 Jul 2020 07:09:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 767CA66070
	for <lists+greybus-dev@lfdr.de>; Fri, 31 Jul 2020 05:09:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6ABFC65F75; Fri, 31 Jul 2020 05:09:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 32DE061805;
	Fri, 31 Jul 2020 05:09:02 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 496DB607B2
 for <greybus-dev@lists.linaro.org>; Fri, 31 Jul 2020 05:09:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2B3106151D; Fri, 31 Jul 2020 05:09:00 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by lists.linaro.org (Postfix) with ESMTPS id 410B9607B2
 for <greybus-dev@lists.linaro.org>; Fri, 31 Jul 2020 05:08:59 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id e22so6688457pjt.3
 for <greybus-dev@lists.linaro.org>; Thu, 30 Jul 2020 22:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JHjIJTBJBTgUWoslHF7PITJJr5gm4KM0Yh2llRAmHQU=;
 b=sjx4tRTOCgyw821PphjLi05UGmsJqpfnvFzXV5vSpq+ZQjzDBbGajOJZmfn2iC4BMh
 uIDkF6cD/9YC10GXbNlF6aXC1T4G8cb6eOuHMWCg63WhtmlMq8eQzGue8ewTDQhdDty0
 GGJwTgIjg2EfCuopO9zXbrjY5iHAFvFQ202ov/R7miDjhxnDKgoELwsIqRiXiIeZ4eoP
 0k8e93wNUAxDJ67pbWUNf5U4qI4Qmch+sErSt2ef+sBmjLOolkFXhEenAKEI6sogX+lx
 4JEuj+vlKWXCN+7qg9JgjkWQvIbVKMOMl/TJGa4THVheAyvw7/Az1vSm150mYedP1pSw
 ALxA==
X-Gm-Message-State: AOAM530EjDA7WTEg6WDkdV9l1hXefoWDLfKX7cifVZszlxMAze1NpgjG
 0I63iUAjtAU9/RcIYkCPYA0=
X-Google-Smtp-Source: ABdhPJy7Oz3Df3DzUKcdAS+mro7JR56UBRqdXPWb3W3RXItZnZmuX3YFJA1+9iWxhbH/q3+TlAsvhg==
X-Received: by 2002:a63:3681:: with SMTP id d123mr2155531pga.317.1596172138333; 
 Thu, 30 Jul 2020 22:08:58 -0700 (PDT)
Received: from gmail.com ([192.55.55.41])
 by smtp.gmail.com with ESMTPSA id r4sm7227679pji.37.2020.07.30.22.08.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 22:08:57 -0700 (PDT)
Date: Fri, 31 Jul 2020 10:38:52 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Colin Ian King <colin.king@canonical.com>
Message-ID: <20200731050850.GA25458@gmail.com>
References: <7da6363c-9423-2b9f-029a-395cc8a932d7@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7da6363c-9423-2b9f-029a-395cc8a932d7@canonical.com>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] issue with uninitialized value used in a
 comparison in gbcodec_mixer_dapm_ctl_put
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

T24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMDU6MDI6MjJQTSArMDEwMCwgQ29saW4gSWFuIEtpbmcg
d3JvdGU6Cj4gSGksCj4gCj4gU3RhdGljIGFuYWx5c2lzIHdpdGggQ292ZXJpdHkgaGFzIGRldGVj
dGVkIGFuIHVuaW5pdGlhbGl6ZWQgdmFsdWUgYmVpbmcKPiB1c2VkIGluIGEgY29tcGFyaXNvbi4g
IFRoZSBlcnJvciB3YXMgZGV0ZWN0ZWQgb24gYSByZWNlbnQgY2hhbmdlIHRvCj4gZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYyBob3dldmVyIHRoZSBpc3N1ZSBhY3R1YWxs
eQo+IGRhdGVzIGJhY2sgdG8gdGhlIG9yaWdpbmFsIGNvbW1pdDoKClRoYW5rcyBDb2xpbiBmb3Ig
cmVwb3J0aW5nIHRoZSBpc3N1ZS4gSSdsbCBmaXggdGhlIHNhbWUgYW5kIHNoYXJlIGEgCnBhdGNo
IHNvb24uCgotLQpSZWdhcmRzLApWYWliaGF2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cg==
