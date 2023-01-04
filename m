Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4E660F85
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Jan 2023 15:35:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A78023EF64
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Jan 2023 14:35:27 +0000 (UTC)
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	by lists.linaro.org (Postfix) with ESMTPS id 162143ECD3
	for <greybus-dev@lists.linaro.org>; Wed,  4 Jan 2023 15:02:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b=nCKXozbQ;
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.15 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1672844561; bh=Gxx8p8mpsg9J44j8zqgcHN1uUXlyWdyKyrs6bhfzWxk=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=nCKXozbQ901kZvOchjH1D10FPAwM2IqGb1fn/ViN2k6hDV7thbPOMh5+U6HXTJeYt
	 utDnNsTZQ1VxPgBpobrmh1MM4nU76m2Juy1w532D2O+D2UqfJuf2lGn7u7AJWNKrc3
	 LII0El9YhNLXA3D4jg80tp7lrgOs1MusTJa+oTqY=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  4 Jan 2023 16:02:41 +0100 (CET)
X-EA-Auth: ns1gYKoffHkdcXKgpzCMeK7t42qdBucUa46mVRkBNVeaeO+9qZ2eFPZ/rjcUQzgTjV+E5JIKm/U0moGyItmS6KukCk/RJckR
Date: Wed, 4 Jan 2023 20:32:35 +0530
From: Deepak R Varma <drv@mailo.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <Y7WVC1mpIWdoi+IS@qemulion>
References: <Y7T5MYfANf2xVsEx@qemulion>
 <f943d3ca-7cf7-cb4d-5dc7-1e45015ba213@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f943d3ca-7cf7-cb4d-5dc7-1e45015ba213@ieee.org>
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailo.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[213.182.54.15:from];
	R_SPF_ALLOW(-0.20)[+ip4:213.182.54.0/24];
	R_DKIM_ALLOW(-0.20)[mailo.com:s=mailo];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:8304, ipnet:213.182.32.0/19, country:FR];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,flexible_array.cocci:url,msg-4.mailo.com:rdns,msg-4.mailo.com:helo];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mailo.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 162143ECD3
X-Spamd-Bar: ---------
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DJZUV3SDTBGFPEN4MAUFZCTS5VEGJVTJ
X-Message-ID-Hash: DJZUV3SDTBGFPEN4MAUFZCTS5VEGJVTJ
X-Mailman-Approved-At: Sat, 07 Jan 2023 14:35:16 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Saurabh Singh Sengar <ssengar@microsoft.com>, Praveen Kumar <kumarpraveen@linux.microsoft.com>, Deepak R Varma <drv@mailo.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Replace zero-length array by DECLARE_FLEX_ARRAY() helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DJZUV3SDTBGFPEN4MAUFZCTS5VEGJVTJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 04, 2023 at 07:33:57AM -0600, Alex Elder wrote:
> On 1/3/23 9:57 PM, Deepak R Varma wrote:
> > The code currently uses C90 standard extension based zero length array
> > struct which is now deprecated and the new C99 standard extension of
> > flexible array declarations are to be used instead. Also, the macro
> > DECLARE_FLEX_ARRAY() allows to use single flexible array member in a
> > structure. Refer to these links [1], [2] for details.
>
> Thank you for citing some references in your commit, it's
> a good and helpful practice.  This might have been another
> helpful one:
>
> https://lore.kernel.org/lkml/20210827163015.3141722-2-keescook@chromium.org/

Hello Alex,
Thank you so much for the feedback. I will include the additional reference and
send in a v2.

>
> > [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> > [2] https://lkml.kernel.org/r/YxKY6O2hmdwNh8r8@work
>
> FYI, Linux mailing lists hosted by kernel.org are normally
> cited using "lore.kernel.org" now, e.g.:
>   https://lore.kernel.org/lkml/YxKY6O2hmdwNh8r8@work
> Your patch is fine, this is just so you can consider this
> in the future.

Sure, I will. This is very helpful to know.

>
> > Issue identified using Coccinelle flexible_array.cocci semantic patch.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
>
> Looks good to me.

Appreciate your time for the review and comments. I will include the reviewed by
tag in my v2.

Regards,
./drv

>
> Reviewed-by: Alex Elder <elder@linaro.org>
>
> > ---
> >   drivers/staging/greybus/usb.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> > index 8e9d9d59a357..b7badf87a3f0 100644
> > --- a/drivers/staging/greybus/usb.c
> > +++ b/drivers/staging/greybus/usb.c
> > @@ -27,7 +27,7 @@ struct gb_usb_hub_control_request {
> >   };
> >
> >   struct gb_usb_hub_control_response {
> > -	u8 buf[0];
> > +	DECLARE_FLEX_ARRAY(u8, buf);
> >   };
> >
> >   struct gb_usb_device {
> > --
> > 2.34.1
> >
> >
> >
>


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
