Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6AA904A0
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 15:45:09 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D91D144B18
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 13:45:08 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id D6A5D3F63E
	for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 13:45:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=DIqVPSEp;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Sse+MWmWlUd4okV9BvuTdMxj6pvfwR3JRfox5MJ9mM4=;
  b=DIqVPSEpeLCVXm75PNoQiMZRvdri/xgpKOU7Ynad6EhLnwMuj1gOw5cd
   n9ppAAvhr8GLhMDrR5ZYn+tucmhiIpQW0AJ4Ju63tf6GpX6Hg0itN83Bc
   UWhgPHNNvcYa6TGD95MKDwHAny4suflBow3WZLRjTYqgDp9fR3ac026Qi
   U=;
X-IronPort-AV: E=Sophos;i="6.15,216,1739833200";
   d="scan'208";a="218156110"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 15:45:01 +0200
Date: Wed, 16 Apr 2025 15:45:00 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <490ab216-982e-4707-abe4-a5b8d0444458@gmail.com>
Message-ID: <eec572fd-3074-8f2c-f978-94841edf7a6@inria.fr>
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com> <490ab216-982e-4707-abe4-a5b8d0444458@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: D6A5D3F63E
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[192.134.164.83:from];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: E4CVV4S5RT7VAVX5RHDUGPIN524HVVBH
X-Message-ID-Hash: E4CVV4S5RT7VAVX5RHDUGPIN524HVVBH
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: rujra <braker.noob.kernel@gmail.com>, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the checks as first-patch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E4CVV4S5RT7VAVX5RHDUGPIN524HVVBH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 16 Apr 2025, Ayush Singh wrote:

> On 4/16/25 17:47, rujra wrote:
>
> > added comments on spinlocks for producer-consumer model, rearranged the
> > lines on function calls where it should not end with "(" this bracket,
> > also removed white-spaces and aligned the arguments of function calls.
>
> Are these manual adjustments, or using clang-format?
>
> I do not care about formatting being "readable". As long as it can be done by
> a tool like clang-format, that's fine with me.
>
> Of course if you are fixing some checkpatch error, that is okay, but if now,
> please avoid formatting changes.
>
> The comments are fine. Although you probably want to add a space between `//`
> and the sentence start.

I don't think the kernel commonly uses // for comments.

julia

>
>
> >
> > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> >
> > > 8------------------------------------------------------8<
> >   drivers/greybus/gb-beagleplay.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/greybus/gb-beagleplay.c
> > b/drivers/greybus/gb-beagleplay.c
> > index 473ac3f2d382..fa1c3a40dd0b 100644
> > --- a/drivers/greybus/gb-beagleplay.c
> > +++ b/drivers/greybus/gb-beagleplay.c
> > @@ -73,7 +73,9 @@ struct gb_beagleplay {
> >          struct gb_host_device *gb_hd;
> >
> >          struct work_struct tx_work;
> > +       //used to ensure that only one producer can access the shared
> > resource at a time.
> >          spinlock_t tx_producer_lock;
> > +       //used to ensure that only one consumer can access the shared
> > resource at a time.
> >          spinlock_t tx_consumer_lock;
> >          struct circ_buf tx_circ_buf;
> >          u16 tx_crc;
> > @@ -642,8 +644,8 @@ static int cc1352_bootloader_wait_for_ack(struct
> > gb_beagleplay *bg)
> >   {
> >          int ret;
> >
> > -       ret = wait_for_completion_timeout(
> > -               &bg->fwl_ack_com,
> > msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> > +       ret = wait_for_completion_timeout(&bg->fwl_ack_com,
> > +
> > msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> >          if (ret < 0)
> >                  return dev_err_probe(&bg->sd->dev, ret,
> >                                       "Failed to acquire ack semaphore");
> > @@ -680,9 +682,8 @@ static int cc1352_bootloader_get_status(struct
> > gb_beagleplay *bg)
> >          if (ret < 0)
> >                  return ret;
> >
> > -       ret = wait_for_completion_timeout(
> > -               &bg->fwl_cmd_response_com,
> > -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> > +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
> > +
> > msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> >          if (ret < 0)
> >                  return dev_err_probe(&bg->sd->dev, ret,
> >                                       "Failed to acquire last status
> > semaphore");
> > @@ -765,9 +766,8 @@ static int cc1352_bootloader_crc32(struct
> > gb_beagleplay *bg, u32 *crc32)
> >          if (ret < 0)
> >                  return ret;
> >
> > -       ret = wait_for_completion_timeout(
> > -               &bg->fwl_cmd_response_com,
> > -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> > +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
> > +
> > msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> >          if (ret < 0)
> >                  return dev_err_probe(&bg->sd->dev, ret,
> >                                       "Failed to acquire last status
> > semaphore");
> > --
> > 2.43.0
>
>
> Best Regards,
>
> Ayush Singh
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
