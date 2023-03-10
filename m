Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3156B556C
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:18:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ED0233F4FD
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:17:59 +0000 (UTC)
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	by lists.linaro.org (Postfix) with ESMTPS id 398E73F496
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 18:36:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b=VXwfo2q7;
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.15 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1678473362; bh=R8VIWH86YEuMdOEa47gN7/p87qOpPJqLkZFEdUZtOL8=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=VXwfo2q74wUU77lYQQ+X/H+yUBUevT7LBBL5feaN2qk0OK+j5zz8ofZMGbRgDb+RT
	 GYvpV71fWoEalQoupmiljpNs6H63Wd9llFoeFIrVi6gzcOQKWKuV+F5fcm0roJs8HU
	 DwAi6AqjHMNGqeUqqkyhAm80avNGevey/Da3HxHE=
Received: by b221-4.in.mailobj.net [192.168.90.24] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Fri, 10 Mar 2023 19:36:01 +0100 (CET)
X-EA-Auth: B1BZxEJXygdy4WBBH+svqvhT1zouqS8syIG8k+nMVKHB6ZaLu5TSsMPx0Tq6qI+OMMNCmqsJ4SUPuIyDWX5pi4ETeV+5q5qm
Date: Sat, 11 Mar 2023 00:05:54 +0530
From: Deepak R Varma <drv@mailo.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 398E73F496
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailo.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:213.182.54.0/24];
	R_DKIM_ALLOW(-0.20)[mailo.com:s=mailo];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:8304, ipnet:213.182.32.0/19, country:FR];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mailo.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: RSZ2SUXUDD3MMSZ6EF4F5SC23SRSN4VQ
X-Message-ID-Hash: RSZ2SUXUDD3MMSZ6EF4F5SC23SRSN4VQ
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:38 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix exceeds line length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RSZ2SUXUDD3MMSZ6EF4F5SC23SRSN4VQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 10, 2023 at 10:09:47PM +0500, Khadija Kamran wrote:
> Length of line 182 exceeds 100 columns in file
> drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
> line.

Hi Khadija,
I think if you also include merging the if condition and the call to
spin_unlock...() on single lines, it should make the code more human. This would
result in updating the patch subject and log message since you are doing more
than "remove tabs". Can you try that and include in the next revision?

Deepak.

> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..0f0fbc263f8a 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -179,7 +179,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
>  					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +						WD_STATE_COLDBOOT_TRIG);
>  					spin_unlock_irqrestore(&arche_pdata->wake_lock,
>  							       flags);
>  					return IRQ_WAKE_THREAD;
> -- 
> 2.34.1
> 
> 


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
