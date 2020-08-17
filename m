Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD16246420
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Aug 2020 12:09:41 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 030EF61868
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Aug 2020 10:09:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EACFC65F75; Mon, 17 Aug 2020 10:09:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D334765F83;
	Mon, 17 Aug 2020 10:09:22 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 88E6F6063E
 for <greybus-dev@lists.linaro.org>; Mon, 17 Aug 2020 10:08:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 76BAE61868; Mon, 17 Aug 2020 10:08:33 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by lists.linaro.org (Postfix) with ESMTPS id 639686063E
 for <greybus-dev@lists.linaro.org>; Mon, 17 Aug 2020 10:08:31 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id w14so16811513ljj.4
 for <greybus-dev@lists.linaro.org>; Mon, 17 Aug 2020 03:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XhlSNhtZvHLg+bhgqbrpT6hylh072knTGhczA9B2mA4=;
 b=RrRB8ow9qLg6EmNuyxxmceti8VWtX1eY+z1aOwX1sLEn+PNuEpAWZjB7Lny76lDRB8
 K7TbCD1WPyisBviKBCpnYThQviR/awfVoQzicW9MVyBcMXg5mLpCd2I0x886zvwh8mpD
 Dp9M874JeDFhq94B7bwO/yIfPI1GwAsX2GqeQ500/+VED56ojV9SWsiW1bEIlZerMq+g
 kGOldBo+KWHB4yJMg2XocAVOUL49MY7K2cecnqkC8uXhP0Y2PUBO/5IfM/mqbbWxKe93
 AIojiaFYIOJwJqiehnCfrSf//svqeWOcG+9o1JP5TDWEmu1LowP5FPl9lwCyoSP55P+y
 uShQ==
X-Gm-Message-State: AOAM530wUvOSAz2FeMuWbpFdWzQ5jVXPRajb27+EXyTIuEIaeRRAvFVn
 fnIkUO2AAwy2dYYZPPsq/Ew=
X-Google-Smtp-Source: ABdhPJyD/+m0rGpxyR4+YdYy2a57ZFOOj41ukpuKcL2yjP3l0AcQIxK7AYwT4qmHAmZq+vtvc9iAbg==
X-Received: by 2002:a2e:865a:: with SMTP id i26mr6711762ljj.246.1597658910158; 
 Mon, 17 Aug 2020 03:08:30 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id g19sm4926712ljn.91.2020.08.17.03.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 03:08:29 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1k7c43-0001DO-Hm; Mon, 17 Aug 2020 12:08:28 +0200
Date: Mon, 17 Aug 2020 12:08:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Wang Qing <wangqing@vivo.com>
Message-ID: <20200817100827.GB3383@localhost>
References: <1597289690-22857-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597289690-22857-1-git-send-email-wangqing@vivo.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] drivers/greybus: Use kobj_to_dev() instead
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

T24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMTE6MzQ6NDhBTSArMDgwMCwgV2FuZyBRaW5nIHdyb3Rl
Ogo+IFVzZSBrb2JqX3RvX2RldigpIGluc3RlYWQgb2YgY29udGFpbmVyX29mKCkKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29tPgoKSSdkIHNob3J0ZW4gdGhl
IHN1bW1hcnkgc29tZXdoYXQ6CgoJZ3JleWJ1czogdXNlIGtvYmpfdG9fZGV2KCkKCmJ1dCBsb29r
cyBnb29kIG90aGVyd2lzZS4KCkFja2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5v
cmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
