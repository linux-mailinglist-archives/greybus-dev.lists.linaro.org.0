Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14C319C2B
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 10:55:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B282460649
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 09:55:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A3DCE60E20; Fri, 12 Feb 2021 09:55:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 47051618F4;
	Fri, 12 Feb 2021 09:55:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2DA6260649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:55:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1AD7260F06; Fri, 12 Feb 2021 09:55:34 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by lists.linaro.org (Postfix) with ESMTPS id 56E9960E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:55:33 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id o38so5877114pgm.9
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 01:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D7Yd2gi+KI4gPD0nZT1VEYRq+EDsM1Zcn3kMJP9fD0A=;
 b=XZ0zNqECTWwTVoZMms4BUM+OUrkKOe5ekfWOvKzO33T8A4cB+1g1MN0ylAvnTXzfZy
 ufBOy2v0VFiG2AN39O1XiQLFt52lAu/6b0fxkGpUl89Dq4aQalFPa8jOVF70sjZfoEEI
 ftzv5HPp3epS5+sqVKbayS8WOTQ4vQzkVaqP++GQ3HuOmBSVucjxM9Mu4Dp2Zb05+8km
 0r7ueb/UIRGm3d+SP6UJoDzpdNt70feQrfsUKRoVFbSzPzlSM0DEwgVZZXl+JjBoggUJ
 ZHSxLahflfUkIk+4NenmWoUxTPTjK8Df60D/dS0ypv8SDt998+JmGk5w650QUBsaDgvn
 6Q8Q==
X-Gm-Message-State: AOAM531hmG2qWiriv9hkXFxTLy0A3i6902mal/n6b6EfAjIWhmtNORtb
 zKvWOzIrui+sj1az5FjzHEm1zEjZ
X-Google-Smtp-Source: ABdhPJz/AAQZNSDiokFZ2T7m8vBev8D9/51jRrArWknSlPXRoWrEXGh+hysWkS4poObxzimtSM67FA==
X-Received: by 2002:a62:8445:0:b029:1c1:c862:8fc4 with SMTP id
 k66-20020a6284450000b02901c1c8628fc4mr2199503pfd.77.1613123732518; 
 Fri, 12 Feb 2021 01:55:32 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id l25sm7841344pff.105.2021.02.12.01.55.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Feb 2021 01:55:31 -0800 (PST)
Date: Fri, 12 Feb 2021 15:25:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20210212095529.2nsjc5wacegnd757@vireshk-i7>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
 <20210212090926.ox763j3btrqfzzzj@vireshk-i7>
 <YCZHsMPgyqtRMTII@kroah.com>
 <20210212092130.cxo6tuess6msf4kb@vireshk-i7>
 <YCZPzV7KiT/y//m2@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCZPzV7KiT/y//m2@hovoldconsulting.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Pritthijit Nath <pritthijit.nath@icloud.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 vireshk@kernel.org
Subject: Re: [greybus-dev] [PATCH 1/2] staging: greybus: Fixed alignment
	issue in hid.c
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

T24gMTItMDItMjEsIDEwOjUyLCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4gQnV0IHdoYXQgd2lsbCB0
aGUgY2hlY2twYXRjaCBjcmV3IHRoZW4gd29yayBvbj8KCkxvbC4uCgo+IEJldHRlciBzdGFnaW5n
IHRoYW4gdGhlIHJlc3Qgb2YgdGhlIGtlcm5lbC4KClsgL21lIHdvbmRlcmluZyBvbiB3aG8gc3Rv
cHMgdGhlbSBmcm9tIHNlbmRpbmcgcGF0Y2hlcyBmb3IgcmVzdCBvZiB0aGUKa2VybmVsID8gXQoK
LS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
