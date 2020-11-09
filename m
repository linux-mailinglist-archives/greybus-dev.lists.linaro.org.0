Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E11D2AB12C
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Nov 2020 07:19:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2D0F8607A4
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Nov 2020 06:19:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2009A60E20; Mon,  9 Nov 2020 06:19:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2066160F06;
	Mon,  9 Nov 2020 06:19:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A45B260639
 for <greybus-dev@lists.linaro.org>; Mon,  9 Nov 2020 06:19:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8F09B60E20; Mon,  9 Nov 2020 06:19:41 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by lists.linaro.org (Postfix) with ESMTPS id 7FB3A60639
 for <greybus-dev@lists.linaro.org>; Mon,  9 Nov 2020 06:19:40 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id i26so6249006pgl.5
 for <greybus-dev@lists.linaro.org>; Sun, 08 Nov 2020 22:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xtK5VVn4ub7lSj4X7kMlV/GiKLS7kb95jYx9NjVBYnc=;
 b=NgMToPbaAZvZyNE6993nM5gQi0CBKc3KdiGWRbJZ1YV+g1FXYYx5IiVpWfvhbBDYYw
 R2luarhgjN5CcDfUdhkVjfv4g+9kNfuuAuFskz3oN9nL6pefETs7UxlKzuO3Gz624YX2
 b3UGRddjqT7bF9UDmLLrLEI8jYs/iqRXW0VmWO7xlU/OI2iC7GQWGiKuNUCwUWdAeH0o
 fNXznDoQRCeUm9rb4fdfw3ajanAMbHUKmaDacBLFVEpye+QLaiaPXXmzOY/w6gdrIy78
 3r7T3fzB7q6wkMYBQ6lYLtFddxHkoAd96mtZEHsIEx02aNTTWdgd6kHE6H30ZmeRvWdo
 EiAw==
X-Gm-Message-State: AOAM5328CdO/qbFsgxcrty+9DIzhORxwyPgB5VOa/sLiqxl/jP64tvyk
 t362JhU/E1q/ezQsMofLusLXucOv
X-Google-Smtp-Source: ABdhPJyhHBpgmLh6l3tZidiIZ7seOKutiPCRa8RQ3jRTP6GCUcgffk/Bgpzc5AGqeqPKycIskjae7Q==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr11215147pjh.198.1604902779655; 
 Sun, 08 Nov 2020 22:19:39 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id c131sm2303288pfc.57.2020.11.08.22.19.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Nov 2020 22:19:38 -0800 (PST)
Date: Mon, 9 Nov 2020 11:49:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex Elder <elder@linaro.org>
Message-ID: <20201109061936.u72g6yevb5so4ztv@vireshk-i7>
References: <CAF4BF-R1gKuRZ3g3DSHROSxbmBT2gFJxSsZkzjNgBcw1mjuv5Q@mail.gmail.com>
 <135673dd-2732-e453-5833-796af3ea867b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <135673dd-2732-e453-5833-796af3ea867b@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Greg KH <greg@kroah.com>, johan@kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] Authentication and Ecryption
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

T24gMDctMTEtMjAsIDExOjMzLCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9uIDkvMTEvMjAgODo1MiBB
TSwgQ2hyaXN0b3BoZXIgRnJpZWR0IHdyb3RlOgo+ID4gVGhlcmUgaXMgdGhlIENvbXBvbmVudCBB
dXRoZW50aWNhdGlvbiBQcm90b2NvbCB0aGF0IGV4aXN0cyBhbHJlYWR5LAo+ID4gYnV0IEknbSBu
b3QgdGVycmlibHkgZmFtaWxpYXIgd2l0aCBpdC4gSXMgYW55b25lIGFibGUgdG8gY2xhcmlmeSBp
Zgo+ID4gdGhlcmUgaXMgc29tZSBvdmVybGFwIGJldHdlZW4gQ0FQIGFuZCBzb21lIG9mIHRoZSB3
b3JrIHRoYXQgZm9sbG93cz8KPiA+IElmIGl0J3MgcG9zc2libGUgdG8gcmUtdXNlIHNvbWUgb2Yg
dGhlIENBUCwgdGhhdCB3b3VsZCBiZSBuaWNlLgoKV2Ugd2VyZSB0cnlpbmcgdG8gaW1wbGVtZW50
IHNvbWV0aGluZyB3aGljaCBjYW4gYXV0aGVudGljYXRlIGEgbW9kdWxlCmluc2VydGVkIGludG8g
dGhlIHBob25lIHVzaW5nIHNvbWUga2V5cyBwcmVzZW50IHdpdGggdGhlIG1vZHVsZSwgYnV0Cndl
IHdlcmVuJ3QgYWJsZSB0byBmaW5pc2ggdGhlIHdvcmsgYmVmb3JlIHRoZSBwcm9qZWN0IGNsb3Nl
ZC4gU28gaXQKaGFzIHNvbWUgaW5mcmFzdHJ1Y3R1cmUgaW4gcGxhY2UsIGJ1dCBubyByZWFsIHBs
YW4gb24gaG93IHRvIHVzZSBpdApub3cuCgo+IEkgY2FuJ3QgY29tbWVudCBvbiB0aGlzLgoKLS0g
CnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
