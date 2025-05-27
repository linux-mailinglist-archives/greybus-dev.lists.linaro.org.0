Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10BAC46E5
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 05:36:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6323D44493
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 03:36:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 90EAA44493
	for <greybus-dev@lists.linaro.org>; Tue, 27 May 2025 03:36:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=mjigB9WT;
	spf=pass (lists.linaro.org: domain of kees@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=kees@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA51D6115D;
	Tue, 27 May 2025 03:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DC3C4CEEA;
	Tue, 27 May 2025 03:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748316965;
	bh=R6crNMTD7b76Ug/l5ZrajpcpFjKDO6xDU2hYOiw848w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjigB9WTgVWz14jZCwIPJZoUHb07SpURvBPMkpFof/ykW9mnvaobNrnihlq8tmReB
	 CjDVAt4/QWoxArU/fn6YKyPvYqc1RdF3YG43e7LZj1z9lFSEdEwXEvhr7+68w9pfOw
	 fJdIRF0g5SY5Hd7U1d7x6/Q8wZCvs+Se1vVikJhmgUSMiXyJxDvDxQE0my5bCRZbho
	 4Zydyn1x3+DNynX11j+JHF4SiAPDpEcAXJG8OZ2IOjLb/yWkAHMGdUNfJ3rfQ0KIND
	 ZcsPmgdaRouDFFba/EezR365VeZ05Xa2pzSkXdkfIfIP0c9ZzqxI9fp0rln7HHuIt6
	 Q0btl5+xQxgVw==
Date: Mon, 26 May 2025 20:36:02 -0700
From: Kees Cook <kees@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <202505262032.507AD8E0DC@keescook>
References: <20250526110654.3916536-1-clf700383@gmail.com>
 <aDRSaZ4Rq47hjMuY@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aDRSaZ4Rq47hjMuY@stanley.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 90EAA44493
X-Spamd-Bar: -------
Message-ID-Hash: 2WFG65DV3DE52CXSYPCZZRXMDP4NRXA6
X-Message-ID-Hash: 2WFG65DV3DE52CXSYPCZZRXMDP4NRXA6
X-MailFrom: kees@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: clingfei <clf700383@gmail.com>, elder@kernel.org, johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2WFG65DV3DE52CXSYPCZZRXMDP4NRXA6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 26, 2025 at 02:37:13PM +0300, Dan Carpenter wrote:
> On Mon, May 26, 2025 at 07:06:54PM +0800, clingfei wrote:
> > As https://lore.kernel.org/all/20240304211940.it.083-kees@kernel.org/
> 
> I don't want to have to read a link to understand the commit message.
> 
> Does this change really affect anything in terms of "enforce the 0-sized
> destinations" rule?  I don't think this is a destination.  I think Kees
> enabled the checking he wanted.  You should probably CC him since we're
> refering to his email.

FWIW, the above patch became commit 7ba59ac7da2a ("greybus: Avoid fake
flexible array for response data").

> > pointed out, to enforce the 0-sized destinations, the remaining 0-sized
> > destinations need to be handled. Thus the struct
> > gb_control_get_manifest_response and struct gb_i2c_transfer_response
> > are removed.
> 
> Here is a better commit message;
> 
> "We want to get rid of zero size arrays and use flexible arrays instead.
> However, in this case the struct is just one flexible array of u8 which
> adds no value.  Just use a char pointer instead."
> 
> I would have ignored it, probably but actually the
> gb_control_get_manifest_response struct is not used so put that in a
> separate commit.  That's a simpler commit to review.
> 
> "The gb_control_get_manifest_response struct is not used.  Delete it."

The patch content itself looks mechanically correct. I think Dan's style
suggestions would be good to see. Can you send a v2?

-Kees

> 
> > 
> > Signed-off-by: clingfei <clf700383@gmail.com>
> > ---
> >  drivers/staging/greybus/i2c.c             | 9 ++++-----
> >  include/linux/greybus/greybus_protocols.h | 9 ---------
> >  2 files changed, 4 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> > index 14f1ff6d448c..2857c2834206 100644
> > --- a/drivers/staging/greybus/i2c.c
> > +++ b/drivers/staging/greybus/i2c.c
> > @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *connection,
> >  }
> >  
> >  static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count,
> > -				   struct gb_i2c_transfer_response *response)
> > +				   u8 *data)
> >  {
> >  	struct i2c_msg *msg = msgs;
> > -	u8 *data;
> >  	u32 i;
> >  
> > -	if (!response)
> > +	if (!data)
> >  		return;
> > -	data = response->data;
> > +
> >  	for (i = 0; i < msg_count; i++) {
> >  		if (msg->flags & I2C_M_RD) {
> >  			memcpy(msg->buf, data, msg->len);
> > @@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
> >  
> >  	ret = gb_operation_request_send_sync(operation);
> >  	if (!ret) {
> > -		struct gb_i2c_transfer_response *response;
> > +		u8 *response;
> >  
> >  		response = operation->response->payload;
> >  		gb_i2c_decode_response(msgs, msg_count, response);
> 
> I like when parameters are called the same thing on both sides.  The
> name "response" adds no value.  Instead get rid of that variable and
> pass operation->response->payload directly.
> 
> 		gb_i2c_decode_response(msgs, msg_count,
> 				       operation->response->payload);
> 
> regards,
> dan carpenter
> 

-- 
Kees Cook
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
