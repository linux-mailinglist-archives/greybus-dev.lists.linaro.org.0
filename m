Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6765C7D1F02
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Oct 2023 21:16:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2C6D13EC4B
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Oct 2023 19:16:54 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 6DD333EC4B
	for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 19:16:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=RdFYQVNh;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 60AC0B80B89;
	Sat, 21 Oct 2023 19:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6061EC433C7;
	Sat, 21 Oct 2023 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697915803;
	bh=o3hiRg/8G1Iiv0YIVdw4woN39m99Lnio78wd/2HsaNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdFYQVNhEje7aE6E2emoV+ek4GRqn0X1zeGzIBQ4AohYqbXx1jG6dfyY5kdPITO5M
	 Xdj3xv+M1fDiUHdq6yWYcVlqjRxQDg/+kE0wtKIm61odc7nzbf/HRxSRzbBUULmNCA
	 fUwt9gwIzcvapF55WH9Ex8nwb8MS60O9i7bvvKfw=
Date: Sat, 21 Oct 2023 21:16:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Message-ID: <2023102119-comfort-try-840a@gregkh>
References: <20231021133527.GB12776@ubuntu>
 <2023102147-educator-worry-06f4@gregkh>
 <20231021180634.GA17039@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231021180634.GA17039@ubuntu>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6DD333EC4B
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[ams.source.kernel.org:rdns,ams.source.kernel.org:helo,gregkh:email,linuxfoundation.org:dkim,checkpatch.pl:url];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: **
Message-ID-Hash: 6XCIUWW2U6JTBLVU2WSDOJ2HBWNQNEKQ
X-Message-ID-Hash: 6XCIUWW2U6JTBLVU2WSDOJ2HBWNQNEKQ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6XCIUWW2U6JTBLVU2WSDOJ2HBWNQNEKQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 21, 2023 at 11:06:34AM -0700, Nandha Kumar Singaram wrote:
> On Sat, Oct 21, 2023 at 04:45:46PM +0200, Greg Kroah-Hartman wrote:
> > On Sat, Oct 21, 2023 at 06:35:27AM -0700, Nandha Kumar Singaram wrote:
> > > greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
> > > linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
> > > Bcc: 
> > > Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
> > > Reply-To: 
> > > In-Reply-To: <2023102131-slacker-lily-28ff@gregkh>
> > > 
> > > On Sat, Oct 21, 2023 at 11:48:32AM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> > > > > Adhere to linux coding style. Reported by checkpatch.pl:
> > > > > CHECK: Alignment should match open parenthesis
> > > > > 
> > > > > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > > > > ---
> > > > >  drivers/staging/greybus/camera.c | 14 +++++++-------
> > > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > > > index cdbb42cd413b..405c8e78aa72 100644
> > > > > --- a/drivers/staging/greybus/camera.c
> > > > > +++ b/drivers/staging/greybus/camera.c
> > > > > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > > > >  }
> > > > >  
> > > > >  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > > > -		struct gb_camera_configure_streams_response *resp)
> > > > > +				      struct gb_camera_configure_streams_response *resp)
> > > > >  {
> > > > >  	unsigned int max_pkt_size = 0;
> > > > >  	unsigned int i;
> > > > > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > > >   * Validate the stream configuration response verifying padding is correctly
> > > > >   * set and the returned number of streams is supported
> > > > >   */
> > > > > -static const int gb_camera_configure_streams_validate_response(
> > > > > -		struct gb_camera *gcam,
> > > > > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> > > > 
> > > > Why change this line?
> > > >
> > > did these Code change to fix CHECK: Lines should not end with a '(' reported by
> > > checkpatch.pl
> > 
> > That's great, but you didn't say that in your changelog text, so it
> > looks wrong here :(
> > 
> > thanks,
> > 
> > greg k-h
> 
> Sorry for missing that, will add and send the updated patcha

Careful, remember to only do one logical thing per patch.

good luck!

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
