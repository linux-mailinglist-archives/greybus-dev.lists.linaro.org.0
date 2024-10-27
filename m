Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 399399B1DFA
	for <lists+greybus-dev@lfdr.de>; Sun, 27 Oct 2024 15:01:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D49841271
	for <lists+greybus-dev@lfdr.de>; Sun, 27 Oct 2024 14:01:56 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lists.linaro.org (Postfix) with ESMTPS id 7CA653F532
	for <greybus-dev@lists.linaro.org>; Sun, 27 Oct 2024 13:58:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmx.net header.s=s31663417 header.b=r6ej1ZE7;
	spf=pass (lists.linaro.org: domain of ps.report@gmx.net designates 212.227.17.22 as permitted sender) smtp.mailfrom=ps.report@gmx.net;
	dmarc=pass (policy=quarantine) header.from=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730037475; x=1730642275; i=ps.report@gmx.net;
	bh=bWi/NEc4P3B3FvW/T2ab0ufVo2IZ3Jbh48ZRpmqYWks=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r6ej1ZE7oH5fxrJ5OyN55qGO5skB2GKUIx7whN5Qe5GtenS+jlTIdlCyEwzpKEr1
	 H5Q2+nvPgmrY1nroxJh7ynKNztnbIUU8qths038TnIyc6PO8Y3h1NSv4ugoACGGfb
	 G1T3tJID5bL5SIkkyy18csBM91DMjylZbKucp9UT7O0WDX6pJkx//ZN/nAToHisFV
	 J6IjLQ1A2n+s0ERslglMISjAzONtrKFJOGag8kcmW9wE3M1MFjpLx/S6fFfWzDin+
	 q8F8ieR8eVsQEAKerzIQg5/h1v1JkfDqsIIDwgQvlgnH3DDQ6cVhPxMva5aQN6qPE
	 LKCLGP2LrcYQ5wTCOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.151]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFzx-1tD47S0F7t-001fE5; Sun, 27
 Oct 2024 14:57:55 +0100
Date: Sun, 27 Oct 2024 14:57:54 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Message-ID: <20241027145754.78cff9c4@gmx.net>
In-Reply-To: <20241027075304.7301-1-surajsonawane0215@gmail.com>
References: <20241027075304.7301-1-surajsonawane0215@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:IdySHA4QGKTxXm1k3NhbySQQEnl7Jl0bme++Ri9BFcHBkAX156P
 HJuoYODmJmLGidMUndyk2RjdkTDdM1wq808vn3D0UGfBb98vxRBwyOODeV9tQlYGKKy3D5Y
 EaR1b/pcK7Bq4vM1i+c6GGm6Wh2hXoH6OWj97HpY2aST2KaLGL2LtKi9Tnn/p4HmKBRVFWZ
 ypFdyaFSCfSvyGtqpSCFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4lOxwOk8zAs=;sTN2PwSWYBbls9g2AnErx/ATcZU
 qJ5doSnZ2j/XHNpuC5103yqPcabnXopIHmmeTxF96sojGKGolfTyUMBSDLDPiktc3EOQE+3Ug
 fQLsitvDtLv9tmwO7MdJavbN1BXcaycYl6J6BrhUKWdJrlyNVFAIek7nxIBil+q8FMtXOKp3W
 dAzeTOMva4KeMhuPQMdoDQ4aRKyjsIEXpUqw3ouHbWdimR7uxQAmRNnYdCyZ2b3JwYHwudwEG
 aXvBQMcr0puZ2Xgtu/akn2MaDNve3nb238B29RarutloSHy7j88le7iajMiBWB6BR2CfslX9r
 xl4dZtac1ag66RLCyonakqMpRiHe26sIiK9uwIbDsfyVG0k4jjIvignGrI/vE8lIUpRJPtfjs
 +Ux9v8vp3BbTq7vxqXbTvXTjE6DnYZKPuG5diuB6B6it3UKX0scGERZFDj3GEMRykfeQJ7iAI
 IrDN+m/2fdKjOkLYh0MBsK90vS2Fh2QRgkXzk5oWOp86nr6ANllAuhbOVaete3umYvW7D5PH/
 /Lgh0VycV2lHPE6/GCjW1pRdPPUpM0ZmiAJveI8AufSS93zIZP38WXEY/+o+CPTF9vDnirPCt
 Xvvx9FS/zsevup3DoHcA7VFgYech1EgS7CqhHaVW7n1hWNTKgm4TyHNafCibZCGTZlEimVt0g
 11RFub61/zn9AutF/RGJk9nhZ2yuYX+AuTmYQvB2R+ac6SGBh/YgSRdEVJZvQmKNr98gO+BGR
 rNxKTQwtF3SvuMskIc0NJbIjgtnDo7/Vxv+mxlzm3xrmeSjBFzXdXCJUZpxf2MgxjE9bM8+o+
 TSo28nb5q2ugXZErPOqs6pGQ==
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RBL_SENDERSCORE_REPUT_6(1.00)[212.227.17.22:from];
	ONCE_RECEIVED(0.20)[];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	R_DKIM_ALLOW(0.00)[gmx.net:s=s31663417];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmx.net,quarantine];
	FREEMAIL_FROM(0.00)[gmx.net];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmx.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[gmx.net:+];
	R_SPF_ALLOW(0.00)[+a:mout.gmx.net];
	ASN(0.00)[asn:8560, ipnet:212.227.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.969];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7CA653F532
X-Spamd-Bar: -
X-MailFrom: ps.report@gmx.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7QIXN4BDU57BBCPWEPXGY4ITQKCUO7OV
X-Message-ID-Hash: 7QIXN4BDU57BBCPWEPXGY4ITQKCUO7OV
X-Mailman-Approved-At: Sun, 27 Oct 2024 14:01:48 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix null pointer dereference in gb_operation_response_send()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7QIXN4BDU57BBCPWEPXGY4ITQKCUO7OV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Suraj,

On Sun, 27 Oct 2024 13:23:04 +0530, Suraj Sonawane <surajsonawane0215@gmail.com> wrote:

> Fix an issue detected by the Smatch static tool:
> drivers/greybus/operation.c:852 gb_operation_response_send() error:
> we previously assumed 'operation->response' could be null (see line 829)
>
> The issue occurs because 'operation->response' may be null if the
> response allocation fails at line 829. However, the code tries to
> access 'operation->response->header' at line 852 without checking if
> it was successfully allocated. This can cause a crash if 'response'
> is null.
>
> To fix this, add a check to ensure 'operation->response' is not null
> before accessing its header. If the response is null, log an error
> message and return -ENOMEM to stop further processing, preventing
> any crashes or undefined behavior.

False warning (?) as the complete code is as follows:

 823 static int gb_operation_response_send(struct gb_operation *operation,
 824                                       int errno)
 825 {
 826         struct gb_connection *connection = operation->connection;
 827         int ret;
 828
 829         if (!operation->response &&
 830             !gb_operation_is_unidirectional(operation)) {
 831                 if (!gb_operation_response_alloc(operation, 0, GFP_KERNEL))
 832                         return -ENOMEM;
 833         }
 834
 835         /* Record the result */
 836         if (!gb_operation_result_set(operation, errno)) {
 837                 dev_err(&connection->hd->dev, "request result already set\n     ");
 838                 return -EIO;    /* Shouldn't happen */
 839         }
 840
 841         /* Sender of request does not care about response. */
 842         if (gb_operation_is_unidirectional(operation))
 843                 return 0;
 844
 845         /* Reference will be dropped when message has been sent. */
 846         gb_operation_get(operation);
 847         ret = gb_operation_get_active(operation);
 848         if (ret)
 849                 goto err_put;
 850
 851         /* Fill in the response header and send it */
 852         operation->response->header->result = gb_operation_errno_map(errno)     ;
 853
 854         ret = gb_message_send(operation->response, GFP_KERNEL);
 855         if (ret)
 856                 goto err_put_active;
 857
 858         return 0;
 859
 860 err_put_active:
 861         gb_operation_put_active(operation);
 862 err_put:
 863         gb_operation_put(operation);
 864
 865         return ret;
 866 }

Lines 829-833 make sure that in case of '!gb_operation_is_unidirectional()'
'operation->response' is allocated (in case of failure early return with
'return -ENOMEM')

Lines 842-843 do an early return in case of 'gb_operation_is_unidirectional()'

So no chance to reach line 852 without 'operation->response' is allocated...

Regards,
Peter

>
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
>  drivers/greybus/operation.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 8459e9bc0..521899fbc 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -849,7 +849,13 @@ static int gb_operation_response_send(struct gb_operation *operation,
>  		goto err_put;
>
>  	/* Fill in the response header and send it */
> -	operation->response->header->result = gb_operation_errno_map(errno);
> +	if (operation->response) {
> +		operation->response->header->result = gb_operation_errno_map(errno);
> +	} else {
> +		dev_err(&connection->hd->dev, "failed to allocate response\n");
> +		ret = -ENOMEM;
> +		goto err_put_active;
> +	}
>
>  	ret = gb_message_send(operation->response, GFP_KERNEL);
>  	if (ret)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
